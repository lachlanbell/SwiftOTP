//
//  UInt64+Data.swift
//  SwiftOTP
//
//  Created by Lachlan Bell on 20/11/18.
//  Copyright © 2018 Lachlan Bell. All rights reserved.
//

import Foundation

extension UInt64 {
	/// Data from UInt64
	var data: Data {
		var int = self
		let intData = Data(bytes: &int, count: MemoryLayout.size(ofValue: self))
		return intData
	}
}
