// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/profiles/v1beta1/models_chain_links.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

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

/// ChainLink contains the data representing either an inter- or cross- chain
/// link
struct Desmos_Profiles_V1beta1_ChainLink {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// User defines the destination profile address to link
  var user: String = String()

  /// Address contains the data of the external chain address to be connected
  /// with the Desmos profile
  var address: Google_Protobuf2_Any {
    get {return _address ?? Google_Protobuf2_Any()}
    set {_address = newValue}
  }
  /// Returns true if `address` has been explicitly set.
  var hasAddress: Bool {return self._address != nil}
  /// Clears the value of `address`. Subsequent reads from it will return its default value.
  mutating func clearAddress() {self._address = nil}

  /// Proof contains the ownership proof of the external chain address
  var proof: Desmos_Profiles_V1beta1_Proof {
    get {return _proof ?? Desmos_Profiles_V1beta1_Proof()}
    set {_proof = newValue}
  }
  /// Returns true if `proof` has been explicitly set.
  var hasProof: Bool {return self._proof != nil}
  /// Clears the value of `proof`. Subsequent reads from it will return its default value.
  mutating func clearProof() {self._proof = nil}

  /// ChainConfig contains the configuration of the external chain
  var chainConfig: Desmos_Profiles_V1beta1_ChainConfig {
    get {return _chainConfig ?? Desmos_Profiles_V1beta1_ChainConfig()}
    set {_chainConfig = newValue}
  }
  /// Returns true if `chainConfig` has been explicitly set.
  var hasChainConfig: Bool {return self._chainConfig != nil}
  /// Clears the value of `chainConfig`. Subsequent reads from it will return its default value.
  mutating func clearChainConfig() {self._chainConfig = nil}

  /// CreationTime represents the time in which the link has been created
  var creationTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _creationTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_creationTime = newValue}
  }
  /// Returns true if `creationTime` has been explicitly set.
  var hasCreationTime: Bool {return self._creationTime != nil}
  /// Clears the value of `creationTime`. Subsequent reads from it will return its default value.
  mutating func clearCreationTime() {self._creationTime = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _address: Google_Protobuf2_Any? = nil
  fileprivate var _proof: Desmos_Profiles_V1beta1_Proof? = nil
  fileprivate var _chainConfig: Desmos_Profiles_V1beta1_ChainConfig? = nil
  fileprivate var _creationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// ChainConfig contains the data of the chain with which the link is made.
struct Desmos_Profiles_V1beta1_ChainConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Proof contains all the data used to verify a signature when linking an
/// account to a profile
struct Desmos_Profiles_V1beta1_Proof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// PubKey represents the public key associated with the address for which to
  /// prove the ownership
  var pubKey: Google_Protobuf2_Any {
    get {return _pubKey ?? Google_Protobuf2_Any()}
    set {_pubKey = newValue}
  }
  /// Returns true if `pubKey` has been explicitly set.
  var hasPubKey: Bool {return self._pubKey != nil}
  /// Clears the value of `pubKey`. Subsequent reads from it will return its default value.
  mutating func clearPubKey() {self._pubKey = nil}

  /// Signature represents the hex-encoded signature of the PlainText value
  var signature: String = String()

  /// PlainText represents the hex-encoded value signed in order to produce the Signature
  var plainText: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pubKey: Google_Protobuf2_Any? = nil
}

/// Bech32Address represents a Bech32-encoded address
struct Desmos_Profiles_V1beta1_Bech32Address {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value represents the Bech-32 encoded address value
  var value: String = String()

  /// Prefix represents the HRP of the Bech32 address
  var prefix: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Base58Address represents a Base58-encoded address
struct Desmos_Profiles_V1beta1_Base58Address {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value contains the Base58-encoded address
  var value: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.profiles.v1beta1"

extension Desmos_Profiles_V1beta1_ChainLink: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChainLink"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "address"),
    3: .same(proto: "proof"),
    4: .standard(proto: "chain_config"),
    5: .standard(proto: "creation_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.user) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._address) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._proof) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._chainConfig) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._creationTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    if let v = self._address {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._proof {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._chainConfig {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if let v = self._creationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_ChainLink, rhs: Desmos_Profiles_V1beta1_ChainLink) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs._address != rhs._address {return false}
    if lhs._proof != rhs._proof {return false}
    if lhs._chainConfig != rhs._chainConfig {return false}
    if lhs._creationTime != rhs._creationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_ChainConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChainConfig"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_ChainConfig, rhs: Desmos_Profiles_V1beta1_ChainConfig) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_Proof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Proof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "pub_key"),
    2: .same(proto: "signature"),
    3: .standard(proto: "plain_text"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._pubKey) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.signature) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.plainText) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._pubKey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularStringField(value: self.signature, fieldNumber: 2)
    }
    if !self.plainText.isEmpty {
      try visitor.visitSingularStringField(value: self.plainText, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_Proof, rhs: Desmos_Profiles_V1beta1_Proof) -> Bool {
    if lhs._pubKey != rhs._pubKey {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.plainText != rhs.plainText {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_Bech32Address: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Bech32Address"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
    2: .same(proto: "prefix"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.value) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.prefix) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 1)
    }
    if !self.prefix.isEmpty {
      try visitor.visitSingularStringField(value: self.prefix, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_Bech32Address, rhs: Desmos_Profiles_V1beta1_Bech32Address) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.prefix != rhs.prefix {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V1beta1_Base58Address: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Base58Address"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.value) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V1beta1_Base58Address, rhs: Desmos_Profiles_V1beta1_Base58Address) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}