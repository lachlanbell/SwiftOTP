//
//  OTPAlgorithm.swift
//  SwiftOTP
//
//  Created by Lachlan Bell
//  Copyright 

import Foundation
import CryptoSwift

public enum OTPAlgorithm {
	// Hash Algorithm to use, either SHA-1, SHA-256 or SHA-512
	case sha1
	case sha256
	case sha512
	
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
