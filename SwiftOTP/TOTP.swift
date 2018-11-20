//
//  TOTP.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import Foundation

/// Time-based one time password object
public struct TOTP {
	public let secret: Data
	public let digits: Int
	public let timeInterval: Int
	public let algorithm: OTPAlgorithm
	
	
	/// Initialise time-based one time password object
	/// - parameter secret: Secret key data
	/// - parameter digits: Number of digits for generated string in range 6...8, defaults to 6
	/// - parameter algorithm: The hashing algorithm to use of type OTPAlgorithm, defaults to SHA-1
	/// - precondition: digits *must* be between 6 and 8 inclusive
	public init?(secret: Data, digits: Int = 6, timeInterval: Int = 30, algorithm: OTPAlgorithm = .sha1) {
		self.secret = secret
		self.digits = digits
		self.timeInterval = timeInterval
		self.algorithm = algorithm
		
		guard validateDigits(digit: digits) else {
			return nil
		}
	}
	
	/// Generate one time password string from Date object
	/// - parameter time: Date object to generate password for
	/// - returns: One time password string, nil if error
	public func generate(time: Date) -> String? {
		let secondsPast1970 = Int(floor(time.timeIntervalSince1970))
		return generate(secondsPast1970: secondsPast1970)
	}
	
	/// Generate one time password string from Unix time
	/// - parameter secondsPast1970: Time since Unix epoch (01 Jan 1970 00:00 UTC)
	/// - returns: One time password string, nil if error
	/// - precondition: secondsPast1970 must be a positive integer
	public func generate(secondsPast1970: Int) -> String? {
		let counterValue = Int(floor(Double(secondsPast1970) / Double(timeInterval)))
		return Generator.shared.generateOTP(secret: secret, algorithm: algorithm, counter: UInt64(counterValue), digits: digits)
	}
	
	/// Check to see if digits value provided is in the range 6...8 (specified in RFC 4226)
	/// - parameter digit: Number of digits for generated string
	private func validateDigits(digit: Int) -> Bool{
		let validDigits = 6...8
		return validDigits.contains(digit)
	}
	
	/// Verify time integer is postive
	/// - parameter time: Time since Unix epoch (01 Jan 1970 00:00 UTC)
	/// - returns: Whether time is valid
	private func validateTime(time: Int) -> Bool {
		return (time > 0)
	}
	
}
