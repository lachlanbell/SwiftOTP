#!/bin/bash

# SwiftOTP Travis CI pre-install script

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
    # Install Carthage and xcpretty
    brew install carthage || true
    brew outdated carthage || brew upgrade carthage
    gem install xcpretty-travis-formatter
    carthage bootstrap --platform iOS --no-use-binaries --cache-builds
elif [[ $TRAVIS_OS_NAME = 'linux' ]]; then
    # Install dependencies
    sudo apt-get install -y \
            binutils \
            git \
            gnupg2 \
            libc6-dev \
            libcurl4 \
            libedit2 \
            libgcc-9-dev \
            libpython2.7 \
            libsqlite3-0 \
            libstdc++-9-dev \
            libxml2 \
            libz3-dev \
            pkg-config \
            tzdata \
            zlib1g-dev
    
    # Download & extract Swift
    wget https://swift.org/builds/swift-5.3.3-release/ubuntu2004/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu20.04.tar.gz
    tar xzf swift-5.3.3-RELEASE-ubuntu20.04.tar.gz
    # Add `swift` to PATH
    export PATH="${PWD}/swift-5.3.3-RELEASE-ubuntu20.04/usr/bin:$PATH"
fi
