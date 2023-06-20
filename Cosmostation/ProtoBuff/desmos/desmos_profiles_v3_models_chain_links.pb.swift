// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/profiles/v3/models_chain_links.proto
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

/// SignatureValueType specifies all the possible signature types
enum Desmos_Profiles_V3_SignatureValueType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// SIGNATURE_VALUE_TYPE_UNSPECIFIED specifies an unknown signing mode
  /// and will be rejected
  case unspecified // = 0

  /// SIGNATURE_VALUE_TYPE_RAW should be used when the value has been
  /// signed as a raw byte array
  case raw // = 1

  /// SIGNATURE_VALUE_TYPE_COSMOS_DIRECT should be used when the signed
  /// value has been encoded as a Protobuf transaction containing the owner
  /// address inside its memo field
  case cosmosDirect // = 2

  /// SIGNATURE_VALUE_TYPE_COSMOS_AMINO should be used when the value has
  /// been encoded as an Amino transaction containing the owner address inside
  /// its memo field
  case cosmosAmino // = 3

  /// SIGNATURE_VALUE_TYPE_EVM_PERSONAL_SIGN should be used when the value
  /// has been encoded following the EVM personal_sign specification
  case evmPersonalSign // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .raw
    case 2: self = .cosmosDirect
    case 3: self = .cosmosAmino
    case 4: self = .evmPersonalSign
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .raw: return 1
    case .cosmosDirect: return 2
    case .cosmosAmino: return 3
    case .evmPersonalSign: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Desmos_Profiles_V3_SignatureValueType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Desmos_Profiles_V3_SignatureValueType] = [
    .unspecified,
    .raw,
    .cosmosDirect,
    .cosmosAmino,
    .evmPersonalSign,
  ]
}

#endif  // swift(>=4.2)

/// ChainLink contains the data representing either an inter- or cross- chain
/// link
struct Desmos_Profiles_V3_ChainLink {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// User defines the destination profile address to link
  var user: String = String()

  /// Address contains the data of the external chain address to be connected
  /// with the Desmos profile
  var address: SwiftProtobuf.Google_Protobuf_Any {
    get {return _address ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_address = newValue}
  }
  /// Returns true if `address` has been explicitly set.
  var hasAddress: Bool {return self._address != nil}
  /// Clears the value of `address`. Subsequent reads from it will return its default value.
  mutating func clearAddress() {self._address = nil}

  /// Proof contains the ownership proof of the external chain address
  var proof: Desmos_Profiles_V3_Proof {
    get {return _proof ?? Desmos_Profiles_V3_Proof()}
    set {_proof = newValue}
  }
  /// Returns true if `proof` has been explicitly set.
  var hasProof: Bool {return self._proof != nil}
  /// Clears the value of `proof`. Subsequent reads from it will return its default value.
  mutating func clearProof() {self._proof = nil}

  /// ChainConfig contains the configuration of the external chain
  var chainConfig: Desmos_Profiles_V3_ChainConfig {
    get {return _chainConfig ?? Desmos_Profiles_V3_ChainConfig()}
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

  fileprivate var _address: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _proof: Desmos_Profiles_V3_Proof? = nil
  fileprivate var _chainConfig: Desmos_Profiles_V3_ChainConfig? = nil
  fileprivate var _creationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// ChainConfig contains the data of the chain with which the link is made.
struct Desmos_Profiles_V3_ChainConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Proof contains all the data used to verify a signature when linking an
/// account to a profile
struct Desmos_Profiles_V3_Proof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// PubKey represents the public key associated with the address for which to
  /// prove the ownership
  var pubKey: SwiftProtobuf.Google_Protobuf_Any {
    get {return _pubKey ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_pubKey = newValue}
  }
  /// Returns true if `pubKey` has been explicitly set.
  var hasPubKey: Bool {return self._pubKey != nil}
  /// Clears the value of `pubKey`. Subsequent reads from it will return its default value.
  mutating func clearPubKey() {self._pubKey = nil}

  /// Signature represents the hex-encoded signature of the PlainText value
  var signature: SwiftProtobuf.Google_Protobuf_Any {
    get {return _signature ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_signature = newValue}
  }
  /// Returns true if `signature` has been explicitly set.
  var hasSignature: Bool {return self._signature != nil}
  /// Clears the value of `signature`. Subsequent reads from it will return its default value.
  mutating func clearSignature() {self._signature = nil}

  /// PlainText represents the hex-encoded value signed in order to produce the
  /// Signature
  var plainText: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pubKey: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _signature: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// Bech32Address represents a Bech32-encoded address
struct Desmos_Profiles_V3_Bech32Address {
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
struct Desmos_Profiles_V3_Base58Address {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value contains the Base58-encoded address
  var value: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// HexAddress represents an Hex-encoded address
/// NOTE: Currently it only supports keccak256-uncompressed addresses
struct Desmos_Profiles_V3_HexAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Value represents the hex address value
  var value: String = String()

  /// Prefix represents the optional prefix used during address encoding (e.g.
  /// 0x)
  var prefix: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// SingleSignature is the signature data for a single signer
struct Desmos_Profiles_V3_SingleSignature {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Type represents the type of the signature value
  var valueType: Desmos_Profiles_V3_SignatureValueType = .unspecified

  /// Signature is the raw signature bytes
  var signature: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// CosmosMultiSignature is the signature data for a multisig public key
struct Desmos_Profiles_V3_CosmosMultiSignature {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Bitarray specifies which keys within the multisig are signing
  var bitArray: Cosmos_Crypto_Multisig_V1beta1_CompactBitArray {
    get {return _bitArray ?? Cosmos_Crypto_Multisig_V1beta1_CompactBitArray()}
    set {_bitArray = newValue}
  }
  /// Returns true if `bitArray` has been explicitly set.
  var hasBitArray: Bool {return self._bitArray != nil}
  /// Clears the value of `bitArray`. Subsequent reads from it will return its default value.
  mutating func clearBitArray() {self._bitArray = nil}

  /// Signatures is the signatures of the multi-signature
  var signatures: [SwiftProtobuf.Google_Protobuf_Any] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _bitArray: Cosmos_Crypto_Multisig_V1beta1_CompactBitArray? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Desmos_Profiles_V3_SignatureValueType: @unchecked Sendable {}
extension Desmos_Profiles_V3_ChainLink: @unchecked Sendable {}
extension Desmos_Profiles_V3_ChainConfig: @unchecked Sendable {}
extension Desmos_Profiles_V3_Proof: @unchecked Sendable {}
extension Desmos_Profiles_V3_Bech32Address: @unchecked Sendable {}
extension Desmos_Profiles_V3_Base58Address: @unchecked Sendable {}
extension Desmos_Profiles_V3_HexAddress: @unchecked Sendable {}
extension Desmos_Profiles_V3_SingleSignature: @unchecked Sendable {}
extension Desmos_Profiles_V3_CosmosMultiSignature: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.profiles.v3"

extension Desmos_Profiles_V3_SignatureValueType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SIGNATURE_VALUE_TYPE_UNSPECIFIED"),
    1: .same(proto: "SIGNATURE_VALUE_TYPE_RAW"),
    2: .same(proto: "SIGNATURE_VALUE_TYPE_COSMOS_DIRECT"),
    3: .same(proto: "SIGNATURE_VALUE_TYPE_COSMOS_AMINO"),
    4: .same(proto: "SIGNATURE_VALUE_TYPE_EVM_PERSONAL_SIGN"),
  ]
}

extension Desmos_Profiles_V3_ChainLink: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    try { if let v = self._address {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._proof {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._chainConfig {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._creationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_ChainLink, rhs: Desmos_Profiles_V3_ChainLink) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs._address != rhs._address {return false}
    if lhs._proof != rhs._proof {return false}
    if lhs._chainConfig != rhs._chainConfig {return false}
    if lhs._creationTime != rhs._creationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_ChainConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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

  static func ==(lhs: Desmos_Profiles_V3_ChainConfig, rhs: Desmos_Profiles_V3_ChainConfig) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Proof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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
      case 2: try { try decoder.decodeSingularMessageField(value: &self._signature) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.plainText) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._pubKey {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._signature {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.plainText.isEmpty {
      try visitor.visitSingularStringField(value: self.plainText, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_Proof, rhs: Desmos_Profiles_V3_Proof) -> Bool {
    if lhs._pubKey != rhs._pubKey {return false}
    if lhs._signature != rhs._signature {return false}
    if lhs.plainText != rhs.plainText {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Bech32Address: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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

  static func ==(lhs: Desmos_Profiles_V3_Bech32Address, rhs: Desmos_Profiles_V3_Bech32Address) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.prefix != rhs.prefix {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Base58Address: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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

  static func ==(lhs: Desmos_Profiles_V3_Base58Address, rhs: Desmos_Profiles_V3_Base58Address) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_HexAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HexAddress"
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

  static func ==(lhs: Desmos_Profiles_V3_HexAddress, rhs: Desmos_Profiles_V3_HexAddress) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.prefix != rhs.prefix {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_SingleSignature: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SingleSignature"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "value_type"),
    2: .same(proto: "signature"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.valueType) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.signature) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.valueType != .unspecified {
      try visitor.visitSingularEnumField(value: self.valueType, fieldNumber: 1)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_SingleSignature, rhs: Desmos_Profiles_V3_SingleSignature) -> Bool {
    if lhs.valueType != rhs.valueType {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_CosmosMultiSignature: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CosmosMultiSignature"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "bit_array"),
    2: .same(proto: "signatures"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._bitArray) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.signatures) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._bitArray {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.signatures.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.signatures, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_CosmosMultiSignature, rhs: Desmos_Profiles_V3_CosmosMultiSignature) -> Bool {
    if lhs._bitArray != rhs._bitArray {return false}
    if lhs.signatures != rhs.signatures {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
