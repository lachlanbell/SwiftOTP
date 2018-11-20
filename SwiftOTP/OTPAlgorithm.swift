//
//  OTPAlgorithm.swift
//  SwiftOTP
//
//  Created by Lachlan Bell
//  Copyright 

import Foundation
import CryptoSwift

/// Hash algorithm to use for one time password generation
public enum OTPAlgorithm {
	case sha1
	case sha256
	case sha512
	
	/// CryptoSwift HMAC variant equivalent
	internal var hmacVariant: HMAC.Variant {
		switch self {
		case .sha1:
			return HMAC.Variant.sha1
		case .sha256:
			return HMAC.Variant.sha256
		case .sha512:
			return HMAC.Variant.sha512
		}
	}
}
