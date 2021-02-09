#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
    # Run Xcode tests
    set -o pipefail && xcodebuild -workspace SwiftOTP.xcworkspace -scheme 'SwiftOTP-iOS' -sdk iphonesimulator ONLY_ACTIVE_ARCH=no | xcpretty -f `xcpretty-travis-formatter`
    set -o pipefail && xcodebuild test -workspace SwiftOTP.xcworkspace -scheme 'SwiftOTP-iOS' -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO -destination 'platform=iOS Simulator,name=iPhone 8,OS=13.0' | xcpretty -f `xcpretty-travis-formatter`
elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
    # Add `swift` to PATH
    export PATH="${PWD}/swift-5.3.3-RELEASE-ubuntu20.04/usr/bin:$PATH"
    # Run tests
    swift test
fi
