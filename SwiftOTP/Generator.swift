//
//  Generator.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 12/1/18.
//

import Foundation
import CryptoSwift

internal class Generator {

	// Generator singleton
	static let shared = Generator()
	
	/// Generates a one time password string
	/// - parameter secret: The secret key data
	/// - parameter algorithm: The hashing algorithm to use of type OTPAlgorithm
	/// - parameter counter: UInt64 Counter value
	/// - parameter digits: Number of digits for generated string in range 6...8, defaults to 6
	/// - returns: One time password string, nil if error
	func generateOTP(secret: Data, algorithm: OTPAlgorithm = .sha1, counter: UInt64, digits: Int = 6) -> String? {
		// Get byte array of secret key
		let key = secret.bytes
		
		// HMAC message data from counter as big endian
		let counterMessage = counter.bigEndian.data
		
		// HMAC hash counter data with secret key
		let hmac = try! HMAC(key: key, variant: algorithm.hmacVariant).authenticate(counterMessage.bytes)
		
		// Get last 4 bits of hash as offset
		let offset = Int((hmac.last ?? 0x00) & 0x0f)
		
		// Get 4 bytes from the hash from [offset] to [offset + 3]
		let truncatedHMAC = Array(hmac[offset...offset + 3])
		
		// Convert byte array of the truncated hash to data
		let data =  Data(bytes: truncatedHMAC)
		
		// Convert data to UInt32
		var number = UInt32(strtoul(data.toHexString(), nil, 16))
		
		// Mask most significant bit
		number &= 0x7fffffff
		
		// Modulo number by 10^(digits)
		number = number % UInt32(pow(10, Float(digits)))

		// Convert int to string
		let strNum = String(number)
		
		// Return string if adding leading zeros is not required
		if strNum.count == digits {
			return strNum
		}
		
		// Add zeros to start of string if not present and return
		let prefixedZeros = String(repeatElement("0", count: (digits - strNum.count)))
		return (prefixedZeros + strNum)
	}
}
