// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: bitsong/nft/v1beta1/nft.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

/// Copyright (c) 2016-2021 Shanghai Bianjie AI Technology Inc. (licensed under the Apache License, Version 2.0)
/// Modifications Copyright (c) 2021, CRO Protocol Labs ("Crypto.org") (licensed under the Apache License, Version 2.0)
/// Modifications Copyright (c) 2021, BitSong srl ("bitsong.io") (licensed under the Apache License, Version 2.0)

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

/// BaseNFT defines a non-fungible token
struct Bitsong_Nft_V1beta1_BaseNFT {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var name: String = String()

  var uri: String = String()

  var owner: String = String()

  var isPrimary: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Denom defines a type of NFT
struct Bitsong_Nft_V1beta1_Denom {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var name: String = String()

  var creators: [String] = []

  var splitShares: [String] = []

  var royaltyShare: String = String()

  var minter: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// IDCollection defines a type of collection with specified ID
struct Bitsong_Nft_V1beta1_IDCollection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var denomID: String = String()

  var tokenIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Owner defines a type of owner
struct Bitsong_Nft_V1beta1_Owner {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var address: String = String()

  var idCollections: [Bitsong_Nft_V1beta1_IDCollection] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Collection defines a type of collection
struct Bitsong_Nft_V1beta1_Collection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var denom: Bitsong_Nft_V1beta1_Denom {
    get {return _denom ?? Bitsong_Nft_V1beta1_Denom()}
    set {_denom = newValue}
  }
  /// Returns true if `denom` has been explicitly set.
  var hasDenom: Bool {return self._denom != nil}
  /// Clears the value of `denom`. Subsequent reads from it will return its default value.
  mutating func clearDenom() {self._denom = nil}

  var nfts: [Bitsong_Nft_V1beta1_BaseNFT] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _denom: Bitsong_Nft_V1beta1_Denom? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bitsong.nft.v1beta1"

extension Bitsong_Nft_V1beta1_BaseNFT: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BaseNFT"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "uri"),
    4: .same(proto: "owner"),
    5: .same(proto: "isPrimary"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.uri) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 5: try { try decoder.decodeSingularBoolField(value: &self.isPrimary) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.uri.isEmpty {
      try visitor.visitSingularStringField(value: self.uri, fieldNumber: 3)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 4)
    }
    if self.isPrimary != false {
      try visitor.visitSingularBoolField(value: self.isPrimary, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Nft_V1beta1_BaseNFT, rhs: Bitsong_Nft_V1beta1_BaseNFT) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.uri != rhs.uri {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.isPrimary != rhs.isPrimary {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Nft_V1beta1_Denom: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Denom"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "creators"),
    4: .standard(proto: "split_shares"),
    5: .standard(proto: "royalty_share"),
    6: .same(proto: "minter"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.creators) }()
      case 4: try { try decoder.decodeRepeatedStringField(value: &self.splitShares) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.royaltyShare) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.minter) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.creators.isEmpty {
      try visitor.visitRepeatedStringField(value: self.creators, fieldNumber: 3)
    }
    if !self.splitShares.isEmpty {
      try visitor.visitRepeatedStringField(value: self.splitShares, fieldNumber: 4)
    }
    if !self.royaltyShare.isEmpty {
      try visitor.visitSingularStringField(value: self.royaltyShare, fieldNumber: 5)
    }
    if !self.minter.isEmpty {
      try visitor.visitSingularStringField(value: self.minter, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Nft_V1beta1_Denom, rhs: Bitsong_Nft_V1beta1_Denom) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.creators != rhs.creators {return false}
    if lhs.splitShares != rhs.splitShares {return false}
    if lhs.royaltyShare != rhs.royaltyShare {return false}
    if lhs.minter != rhs.minter {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Nft_V1beta1_IDCollection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".IDCollection"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "denom_id"),
    2: .standard(proto: "token_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denomID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.tokenIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denomID.isEmpty {
      try visitor.visitSingularStringField(value: self.denomID, fieldNumber: 1)
    }
    if !self.tokenIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.tokenIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Nft_V1beta1_IDCollection, rhs: Bitsong_Nft_V1beta1_IDCollection) -> Bool {
    if lhs.denomID != rhs.denomID {return false}
    if lhs.tokenIds != rhs.tokenIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Nft_V1beta1_Owner: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Owner"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .standard(proto: "id_collections"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.idCollections) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if !self.idCollections.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.idCollections, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Nft_V1beta1_Owner, rhs: Bitsong_Nft_V1beta1_Owner) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.idCollections != rhs.idCollections {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Nft_V1beta1_Collection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Collection"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
    2: .same(proto: "nfts"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._denom) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.nfts) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._denom {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.nfts.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.nfts, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Nft_V1beta1_Collection, rhs: Bitsong_Nft_V1beta1_Collection) -> Bool {
    if lhs._denom != rhs._denom {return false}
    if lhs.nfts != rhs.nfts {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}