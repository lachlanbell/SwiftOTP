//
//  CryptoSwift
//
//  Copyright (C) 2014-2017 Marcin Krzyżanowski <marcin@krzyzanowskim.com>
//  This software is provided 'as-is', without any express or implied warranty.
//
//  In no event will the authors be held liable for any damages arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
//  - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
//  - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
//  - This notice may not be removed or altered from any source or binary distribution.
//

/*
 *	Data utilities from CryptoSwift. CryptoSwift has been dropped as a dependency,
 *	but these are preserved to maintain API compatability with earlier versions
 * 	of SwiftOTP.
 */

import Foundation

extension Data {
	/// The data represented as a byte array
	public var bytes: Array<UInt8> {
		return Array(self)
	}

	public init(hex: String) {
		self.init(Array<UInt8>(hex: hex))
	}
}

extension Array where Element == UInt8 {

	init(reserveCapacity: Int) {
	  self = Array<Element>()
	  self.reserveCapacity(reserveCapacity)
	}

	public init(hex: String) {
		self.init(reserveCapacity: hex.unicodeScalars.lazy.underestimatedCount)
		var buffer: UInt8?
		var skip = hex.hasPrefix("0x") ? 2 : 0
		for char in hex.unicodeScalars.lazy {
			guard skip == 0 else {
				skip -= 1
				continue
			}

			guard char.value >= 48 && char.value <= 102 else {
				removeAll()
				return
			}
			let v: UInt8
			let c: UInt8 = UInt8(char.value)

			switch c {
			case let c where c <= 57:
			  v = c - 48
			case let c where c >= 65 && c <= 70:
			  v = c - 55
			case let c where c >= 97:
			  v = c - 87
			default:
			  removeAll()
			  return
			}

			if let b = buffer {
				append(b << 4 | v)
				buffer = nil
			} else {
				buffer = v
			}
		}

		if let b = buffer {
			append(b)
		}
	  }

	public func toHexString() -> String {
		`lazy`.reduce(into: "") {
		  var s = String($1, radix: 16)
		  if s.count == 1 {
			s = "0" + s
		  }
		  $0 += s
		}
	}
}
