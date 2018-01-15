//
//  TOTP.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import Foundation

public struct TOTP {
    public let secret: Data        		//Secret Key
    public let digits: Int          	//Digits
	public let timeInterval: Int		//Time interval between codes
	public let algorithm: OTPAlgorithm	//Hashing algorithm to use
    
    
    //Initialise TOTP with given parameters
	public init?(secret: Data, digits: Int = 6, timeInterval: Int = 30, algorithm: OTPAlgorithm = .sha1) {
        self.secret = secret
        self.digits = digits
		self.timeInterval = timeInterval
		self.algorithm = algorithm
        
        guard validateDigits(digit: digits) else {
            return nil
        }
    }
	
	//Generate from a Date object
	public func generate(time: Date) -> String {
		let secondsPast1970 = Int(floor(time.timeIntervalSince1970))
		return generate(secondsPast1970: secondsPast1970)
		
    }
	
	//Generate from Unix Epoch
	public func generate(secondsPast1970: Int) -> String {
		let counterValue = Int(floor(Double(secondsPast1970) / Double(timeInterval)))
		return GenerateOTP(secret: secret, algorithm: algorithm, counter: UInt64(counterValue), digits: digits)
	}
    
    //Check to see if digits value provided is between 6...8 (specified in RFC 4226)
    fileprivate func validateDigits(digit: Int) -> Bool{
        let validDigits = 6...8
        return validDigits.contains(digit)
    }
    
    //Check to see if time is positive
    fileprivate func validateTime(time: Int) -> Bool {
        return (time > 0)
    }
    
}
