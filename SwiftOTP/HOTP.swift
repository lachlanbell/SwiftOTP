//
//  HOTP.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import Foundation

public struct HOTP {
	public let secret: Data        		//Secret Key
	public let digits: Int          	//Digits
	public let algorithm: OTPAlgorithm	//Hashing algorithm to use
	
	
	//Initialise HOTP with given parameters
	public init?(secret: Data, digits: Int = 6, algorithm: OTPAlgorithm = .sha1) {
		self.secret = secret
		self.digits = digits
		self.algorithm = algorithm
		
		guard validateDigits(digit: digits) else {
			return nil
		}
	}
	
	//Generate from comments
	public func generate(counter: Int) -> String {
		return GenerateOTP(secret: secret, algorithm: algorithm, counter: UInt64(counter), digits: digits)
	}
	
	//Check to see if digits value provided is between 6...8 (specified in RFC 4226)
	fileprivate func validateDigits(digit: Int) -> Bool{
		let validDigits = 6...8
		return validDigits.contains(digit)
	}
}
