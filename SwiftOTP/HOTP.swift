//
//  HOTP.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import Foundation

/// Counter-based one time password object
public struct HOTP {
	public let secret: Data
	public let digits: Int
	public let algorithm: OTPAlgorithm
	
	
	/// Initialise counter-based one time password object
	/// - parameter secret: Secret key data
	/// - parameter digits: Number of digits for generated string in range 6...8, defaults to 6
	/// - parameter algorithm: The hashing algorithm to use of type OTPAlgorithm, defaults to SHA-1
	/// - precondition: digits *must* be between 6 and 8 inclusive
	public init?(secret: Data, digits: Int = 6, algorithm: OTPAlgorithm = .sha1) {
		self.secret = secret
		self.digits = digits
		self.algorithm = algorithm
		
		guard validateDigits(digit: digits) else {
			return nil
		}
	}
	
	/// Generate one time password string from counter value
	/// - parameter counter: UInt64 counter value
	/// - returns: One time password string, nil if error
	/// - precondition: Counter value must be of type UInt64
	public func generate(counter: UInt64) -> String? {
		return Generator.shared.generateOTP(secret: secret, algorithm: algorithm, counter: counter, digits: digits)
	}
	
	/// Verify time integer is postive
	/// - parameter time: Time since Unix epoch (01 Jan 1970 00:00 UTC)
	/// - returns: Whether time is valid
	private func validateDigits(digit: Int) -> Bool{
		let validDigits = 6...8
		return validDigits.contains(digit)
	}
}
