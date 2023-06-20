// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/crypto/hd/v1/hd.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Since: cosmos-sdk 0.46

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// BIP44Params is used as path field in ledger item in Record.
struct Cosmos_Crypto_Hd_V1_BIP44Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// purpose is a constant set to 44' (or 0x8000002C) following the BIP43 recommendation
  var purpose: UInt32 = 0

  /// coin_type is a constant that improves privacy
  var coinType: UInt32 = 0

  /// account splits the key space into independent user identities
  var account: UInt32 = 0

  /// change is a constant used for public derivation. Constant 0 is used for external chain and constant 1 for internal
  /// chain.
  var change: Bool = false

  /// address_index is used as child index in BIP32 derivation
  var addressIndex: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Crypto_Hd_V1_BIP44Params: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.crypto.hd.v1"

extension Cosmos_Crypto_Hd_V1_BIP44Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BIP44Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "purpose"),
    2: .standard(proto: "coin_type"),
    3: .same(proto: "account"),
    4: .same(proto: "change"),
    5: .standard(proto: "address_index"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.purpose) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.coinType) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.account) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.change) }()
      case 5: try { try decoder.decodeSingularUInt32Field(value: &self.addressIndex) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.purpose != 0 {
      try visitor.visitSingularUInt32Field(value: self.purpose, fieldNumber: 1)
    }
    if self.coinType != 0 {
      try visitor.visitSingularUInt32Field(value: self.coinType, fieldNumber: 2)
    }
    if self.account != 0 {
      try visitor.visitSingularUInt32Field(value: self.account, fieldNumber: 3)
    }
    if self.change != false {
      try visitor.visitSingularBoolField(value: self.change, fieldNumber: 4)
    }
    if self.addressIndex != 0 {
      try visitor.visitSingularUInt32Field(value: self.addressIndex, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Crypto_Hd_V1_BIP44Params, rhs: Cosmos_Crypto_Hd_V1_BIP44Params) -> Bool {
    if lhs.purpose != rhs.purpose {return false}
    if lhs.coinType != rhs.coinType {return false}
    if lhs.account != rhs.account {return false}
    if lhs.change != rhs.change {return false}
    if lhs.addressIndex != rhs.addressIndex {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
