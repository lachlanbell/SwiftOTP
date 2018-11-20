//
//  TOTPTests.swift
//  SwiftOTPTests
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//
//  Created by Lachlan Bell on 14/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//  distribute, sublicense, create a derivative work, and/or sell copies of the
//  Software in any work that is designed, intended, or marketed for pedagogical or
//  instructional purposes related to programming, coding, application development,
//  or information technology.  Permission for such use, copying, modification,
//  merger, publication, distribution, sublicensing, creation of derivative works,
//  or sale is expressly withheld.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import XCTest
@testable import SwiftOTP

class TOTPTests: XCTestCase {
	// Test values from RFC6238 Appendix B
	// https://tools.ietf.org/html/rfc6238#appendix-B
	// Test functions in order of test value table from the RFC
	
	let dataSHA1 = "12345678901234567890".data(using: String.Encoding.ascii)!
	let dataSHA256 = "12345678901234567890123456789012".data(using: String.Encoding.ascii)!
	let dataSHA512 = "1234567890123456789012345678901234567890123456789012345678901234".data(using: String.Encoding.ascii)!

	func test01() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 59), "94287082")
	}
	
	func test02() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 59), "46119246")
	}
	
	func test03() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 59), "90693936")
	}
	
	func test04() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111109), "07081804")
	}
	
	func test05() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111109), "68084774")
	}
	
	func test06() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111109), "25091201")
	}
	
	func test07() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111111), "14050471")
	}
	
	func test08() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111111), "67062674")
	}
	
	func test09() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1111111111), "99943326")
	}
	
	func test10() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1234567890), "89005924")
	}
	
	func test11() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1234567890), "91819424")
	}
	
	func test12() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 1234567890), "93441116")
	}
	
	func test13() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 2000000000), "69279037")
	}
	
	func test14() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 2000000000), "90698825")
	}
	
	func test15() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 2000000000), "38618901")
	}
	
	func test16() {
		let totp = TOTP(secret: dataSHA1, digits: 8, timeInterval: 30, algorithm: .sha1)
		XCTAssertEqual(totp?.generate(secondsPast1970: 20000000000), "65353130")
	}
	
	func test17() {
		let totp = TOTP(secret: dataSHA256, digits: 8, timeInterval: 30, algorithm: .sha256)
		XCTAssertEqual(totp?.generate(secondsPast1970: 20000000000), "77737706")
	}
	
	func test18() {
		let totp = TOTP(secret: dataSHA512, digits: 8, timeInterval: 30, algorithm: .sha512)
		XCTAssertEqual(totp?.generate(secondsPast1970: 20000000000), "47863826")
	}
}
