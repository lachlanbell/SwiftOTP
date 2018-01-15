//
//  GeneratorTests.swift
//  SwiftOTPTests
//
//  Created by Lachlan Bell on 13/1/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import XCTest
@testable import SwiftOTP

class GeneratorTests: XCTestCase {
	
	// Test values from Appendix D of RFC4226
	// https://tools.ietf.org/html/rfc4226#page-32
	
	func testGenerator6DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 0), "755224")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 1), "287082")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 2), "359152")
	}
	
	func testGenerator7DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 0, digits: 7), "4755224")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 1, digits: 7), "4287082")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 2, digits: 7), "7359152")
	}
	
	func testGenerator8DigitHexSHA1() {
		let data = Data(hex: "3132333435363738393031323334353637383930")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 0, digits: 8), "84755224")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 1, digits: 8), "94287082")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha1, counter: 2, digits: 8), "37359152")
	}
	
	func testGenerator6DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 6), "158995")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 6), "604514")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 6), "762356")
	}
	
	func testGenerator7DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 7), "8158995")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 7), "1604514")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 7), "5762356")
	}
	
	func testGenerator8DigitBase32SHA256() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 0, digits: 8), "38158995")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 1, digits: 8), "51604514")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha256, counter: 2, digits: 8), "95762356")
	}
	
	func testGenerator6DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 6), "339279")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 6), "597655")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 6), "045732")
	}
	
	func testGenerator7DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 7), "7339279")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 7), "4597655")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 7), "4045732")
	}
	
	func testGenerator8DigitBase32SHA512() {
		let data = base32DecodeToData("ABCDEFGHIJKLMNOP")!
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 0, digits: 8), "37339279")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 1, digits: 8), "04597655")
		XCTAssertEqual(GenerateOTP(secret: data, algorithm: .sha512, counter: 2, digits: 8), "34045732")
	}
}
