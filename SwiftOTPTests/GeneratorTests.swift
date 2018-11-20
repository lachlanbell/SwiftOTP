//
//  GeneratorTests.swift
//  SwiftOTPTests
//
//  Created by Lachlan Bell on 13/1/18.
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

class GeneratorTests: XCTestCase {
	
	// Test values from Appendix D of RFC4226
	// https://tools.ietf.org/html/rfc4226#page-32
	
	func testGenerator6DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 0), "755224")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 1), "287082")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 2), "359152")
	}
	
	func testGenerator7DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 0, digits: 7), "4755224")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 1, digits: 7), "4287082")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 2, digits: 7), "7359152")
	}
	
	func testGenerator8DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 0, digits: 8), "84755224")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 1, digits: 8), "94287082")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha1, counter: 2, digits: 8), "37359152")
	}
	
	func testGenerator6DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 6), "158995")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 6), "604514")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 6), "762356")
	}
	
	func testGenerator7DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 7), "8158995")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 7), "1604514")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 7), "5762356")
	}
	
	func testGenerator8DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 8), "38158995")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 8), "51604514")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 8), "95762356")
	}
	
	func testGenerator6DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 6), "339279")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 6), "597655")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 6), "045732")
	}
	
	func testGenerator7DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 7), "7339279")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 7), "4597655")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 7), "4045732")
	}
	
	func testGenerator8DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 8), "37339279")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 8), "04597655")
		XCTAssertEqual(Generator.shared.generateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 8), "34045732")
	}
}
