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
	
	func test01() {
		let hotp = HOTP(secret: base32DecodeToData("abcd")!)!
	}
    
}
