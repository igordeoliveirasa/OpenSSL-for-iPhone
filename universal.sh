#!/bin/sh

clear_environment() {
rm -rf universal
rm -rf bin lib src
}


clear_environment

mkdir universal

original_xcode=`xcode-select --print-path`

# Generating for i386
ARCH="i386"
VERSION="4.4.1"
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
./build-libssl_$ARCH.sh
mv bin/iPhoneSimulator5.1-$ARCH.sdk/lib/libcrypto.a universal/libcrypto_$ARCH.a
mv bin/iPhoneSimulator5.1-$ARCH.sdk/lib/libssl.a universal/libssl_$ARCH.a


# Generating for armv6
ARCH="armv6"
VERSION="4.4.1"
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
./build-libssl_$ARCH.sh
mv bin/iPhoneOS5.1-$ARCH.sdk/lib/libcrypto.a universal/libcrypto_$ARCH.a
mv bin/iPhoneOS5.1-$ARCH.sdk/lib/libssl.a universal/libssl_$ARCH.a


# Generating for armv7
ARCH="armv7"
VERSION="4.5.2"
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
./build-libssl_$ARCH.sh
mv bin/iPhoneOS6.0-$ARCH.sdk/lib/libcrypto.a universal/libcrypto_$ARCH.a
mv bin/iPhoneOS6.0-$ARCH.sdk/lib/libssl.a universal/libssl_$ARCH.a

# Generating for armv7s
ARCH="armv7s"
VERSION="4.5.2"
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
./build-libssl_$ARCH.sh
mv bin/iPhoneOS6.0-$ARCH.sdk/lib/libcrypto.a universal/libcrypto_$ARCH.a
mv bin/iPhoneOS6.0-$ARCH.sdk/lib/libssl.a universal/libssl_$ARCH.a

# Generating for arm64
ARCH="arm64"
VERSION="5.0.0"
sudo xcode-select -switch /Applications/Xcode_$VERSION.app/Contents/Developer
./build-libssl_$ARCH.sh
mv bin/iPhoneOS7.0-$ARCH.sdk/lib/libcrypto.a universal/libcrypto_$ARCH.a
mv bin/iPhoneOS7.0-$ARCH.sdk/lib/libssl.a universal/libssl_$ARCH.a






sudo xcode-select -switch $original_xcode
#/Applications/Xcode_4.5.2.app/Contents/Developer/usr/bin/xcodebuild -project CryptoPP.xcodeproj -sdk iphoneos -target armv7 -configuration Debug CONFIGURATION_BUILD_DIR=universal
#/Applications/Xcode_4.5.2.app/Contents/Developer/usr/bin/xcodebuild -project CryptoPP.xcodeproj -sdk iphoneos -target armv7s -configuration Debug CONFIGURATION_BUILD_DIR=universal
#/Applications/Xcode_4.5.2.app/Contents/Developer/usr/bin/xcodebuild -project CryptoPP.xcodeproj -sdk iphonesimulator -target i386 -configuration Debug CONFIGURATION_BUILD_DIR=universal

#/Applications/Xcode_5.0.0.app/Contents/Developer/usr/bin/xcodebuild -project CryptoPP.xcodeproj -sdk iphoneos -target arm64 -configuration Debug CONFIGURATION_BUILD_DIR=universal

#lipo -create universal/libarmv6.a universal/libarmv7.a universal/libarmv7s.a universal/libi386.a universal/libarm64.a -output universal/libCryptoPPiOS.a

