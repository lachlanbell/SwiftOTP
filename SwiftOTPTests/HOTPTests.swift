//
//  HOTPTests.swift
//  SwiftOTPTests
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import XCTest
@testable import SwiftOTP

class HOTPTests: XCTestCase {
	let data = Data(hex: "3132333435363738393031323334353637383930")
	
	// Test values from Appendix D of RFC4226
	// https://tools.ietf.org/html/rfc4226#page-32
	
	let expectedOTP = ["755224", "287082", "359152", "969429", "338314", "254676", "287922", "162583", "399871", "520489"]
	
	func testHOTP() {
		let hotp = HOTP(secret: data)!
		for i in 0...(expectedOTP.count - 1) {
			XCTAssertEqual(hotp.generate(counter: UInt64(i)), expectedOTP[i])
		}
	}
}
