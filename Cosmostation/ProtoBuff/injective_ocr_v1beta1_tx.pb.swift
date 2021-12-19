// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: injective/ocr/v1beta1/tx.proto
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

struct Injective_Ocr_V1beta1_MsgCreateFeed {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String {
    get {return _storage._sender}
    set {_uniqueStorage()._sender = newValue}
  }

  var config: Injective_Ocr_V1beta1_FeedConfig {
    get {return _storage._config ?? Injective_Ocr_V1beta1_FeedConfig()}
    set {_uniqueStorage()._config = newValue}
  }
  /// Returns true if `config` has been explicitly set.
  var hasConfig: Bool {return _storage._config != nil}
  /// Clears the value of `config`. Subsequent reads from it will return its default value.
  mutating func clearConfig() {_uniqueStorage()._config = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Injective_Ocr_V1beta1_MsgCreateFeedResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgUpdateFeed {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String = String()

  /// feed_id is an unique ID for the target of this config
  var feedID: String = String()

  /// signers ith element is address ith oracle uses to sign a report
  var signers: [String] = []

  /// transmitters ith element is address ith oracle uses to transmit a report via the transmit method
  var transmitters: [String] = []

  /// Fixed LINK reward for each observer
  var linkPerObservation: String = String()

  /// Fixed LINK reward for transmitter
  var linkPerTransmission: String = String()

  /// Native denom for LINK coin in the bank keeper
  var linkDenom: String = String()

  /// feed administrator
  var feedAdmin: String = String()

  /// feed billing administrator
  var billingAdmin: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgUpdateFeedResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgTransmit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Address of the transmitter
  var transmitter: String = String()

  var configDigest: Data = Data()

  var feedID: String = String()

  var epoch: UInt64 = 0

  var round: UInt64 = 0

  var extraHash: Data = Data()

  var report: Injective_Ocr_V1beta1_Report {
    get {return _report ?? Injective_Ocr_V1beta1_Report()}
    set {_report = newValue}
  }
  /// Returns true if `report` has been explicitly set.
  var hasReport: Bool {return self._report != nil}
  /// Clears the value of `report`. Subsequent reads from it will return its default value.
  mutating func clearReport() {self._report = nil}

  var signatures: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _report: Injective_Ocr_V1beta1_Report? = nil
}

struct Injective_Ocr_V1beta1_MsgTransmitResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgFundFeedRewardPool {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String = String()

  var feedID: String = String()

  var amount: Cosmos_Base_V1beta1_Coin {
    get {return _amount ?? Cosmos_Base_V1beta1_Coin()}
    set {_amount = newValue}
  }
  /// Returns true if `amount` has been explicitly set.
  var hasAmount: Bool {return self._amount != nil}
  /// Clears the value of `amount`. Subsequent reads from it will return its default value.
  mutating func clearAmount() {self._amount = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _amount: Cosmos_Base_V1beta1_Coin? = nil
}

struct Injective_Ocr_V1beta1_MsgFundFeedRewardPoolResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPool {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String = String()

  var feedID: String = String()

  var amount: Cosmos_Base_V1beta1_Coin {
    get {return _amount ?? Cosmos_Base_V1beta1_Coin()}
    set {_amount = newValue}
  }
  /// Returns true if `amount` has been explicitly set.
  var hasAmount: Bool {return self._amount != nil}
  /// Clears the value of `amount`. Subsequent reads from it will return its default value.
  mutating func clearAmount() {self._amount = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _amount: Cosmos_Base_V1beta1_Coin? = nil
}

struct Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPoolResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgSetPayees {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String = String()

  var feedID: String = String()

  /// addresses oracles use to transmit the reports
  var transmitters: [String] = []

  /// addresses of payees corresponding to list of transmitters
  var payees: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgSetPayeesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgTransferPayeeship {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// transmitter address of oracle whose payee is changing
  var sender: String = String()

  var transmitter: String = String()

  var feedID: String = String()

  /// new payee address
  var proposed: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgTransferPayeeshipResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgAcceptPayeeship {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// new payee address
  var payee: String = String()

  /// transmitter address of oracle whose payee is changing
  var transmitter: String = String()

  var feedID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Ocr_V1beta1_MsgAcceptPayeeshipResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "injective.ocr.v1beta1"

extension Injective_Ocr_V1beta1_MsgCreateFeed: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateFeed"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "config"),
  ]

  fileprivate class _StorageClass {
    var _sender: String = String()
    var _config: Injective_Ocr_V1beta1_FeedConfig? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _sender = source._sender
      _config = source._config
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularStringField(value: &_storage._sender) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._config) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._sender.isEmpty {
        try visitor.visitSingularStringField(value: _storage._sender, fieldNumber: 1)
      }
      if let v = _storage._config {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgCreateFeed, rhs: Injective_Ocr_V1beta1_MsgCreateFeed) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._sender != rhs_storage._sender {return false}
        if _storage._config != rhs_storage._config {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgCreateFeedResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateFeedResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgCreateFeedResponse, rhs: Injective_Ocr_V1beta1_MsgCreateFeedResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgUpdateFeed: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateFeed"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "feed_id"),
    3: .same(proto: "signers"),
    4: .same(proto: "transmitters"),
    5: .standard(proto: "link_per_observation"),
    6: .standard(proto: "link_per_transmission"),
    7: .standard(proto: "link_denom"),
    8: .standard(proto: "feed_admin"),
    9: .standard(proto: "billing_admin"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.signers) }()
      case 4: try { try decoder.decodeRepeatedStringField(value: &self.transmitters) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.linkPerObservation) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.linkPerTransmission) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.linkDenom) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.feedAdmin) }()
      case 9: try { try decoder.decodeSingularStringField(value: &self.billingAdmin) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 2)
    }
    if !self.signers.isEmpty {
      try visitor.visitRepeatedStringField(value: self.signers, fieldNumber: 3)
    }
    if !self.transmitters.isEmpty {
      try visitor.visitRepeatedStringField(value: self.transmitters, fieldNumber: 4)
    }
    if !self.linkPerObservation.isEmpty {
      try visitor.visitSingularStringField(value: self.linkPerObservation, fieldNumber: 5)
    }
    if !self.linkPerTransmission.isEmpty {
      try visitor.visitSingularStringField(value: self.linkPerTransmission, fieldNumber: 6)
    }
    if !self.linkDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.linkDenom, fieldNumber: 7)
    }
    if !self.feedAdmin.isEmpty {
      try visitor.visitSingularStringField(value: self.feedAdmin, fieldNumber: 8)
    }
    if !self.billingAdmin.isEmpty {
      try visitor.visitSingularStringField(value: self.billingAdmin, fieldNumber: 9)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgUpdateFeed, rhs: Injective_Ocr_V1beta1_MsgUpdateFeed) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs.signers != rhs.signers {return false}
    if lhs.transmitters != rhs.transmitters {return false}
    if lhs.linkPerObservation != rhs.linkPerObservation {return false}
    if lhs.linkPerTransmission != rhs.linkPerTransmission {return false}
    if lhs.linkDenom != rhs.linkDenom {return false}
    if lhs.feedAdmin != rhs.feedAdmin {return false}
    if lhs.billingAdmin != rhs.billingAdmin {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgUpdateFeedResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateFeedResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgUpdateFeedResponse, rhs: Injective_Ocr_V1beta1_MsgUpdateFeedResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgTransmit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransmit"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "transmitter"),
    2: .standard(proto: "config_digest"),
    3: .standard(proto: "feed_id"),
    4: .same(proto: "epoch"),
    5: .same(proto: "round"),
    6: .standard(proto: "extra_hash"),
    7: .same(proto: "report"),
    8: .same(proto: "signatures"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.transmitter) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.configDigest) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.epoch) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.round) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.extraHash) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._report) }()
      case 8: try { try decoder.decodeRepeatedBytesField(value: &self.signatures) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.transmitter.isEmpty {
      try visitor.visitSingularStringField(value: self.transmitter, fieldNumber: 1)
    }
    if !self.configDigest.isEmpty {
      try visitor.visitSingularBytesField(value: self.configDigest, fieldNumber: 2)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 3)
    }
    if self.epoch != 0 {
      try visitor.visitSingularUInt64Field(value: self.epoch, fieldNumber: 4)
    }
    if self.round != 0 {
      try visitor.visitSingularUInt64Field(value: self.round, fieldNumber: 5)
    }
    if !self.extraHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.extraHash, fieldNumber: 6)
    }
    if let v = self._report {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    if !self.signatures.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.signatures, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgTransmit, rhs: Injective_Ocr_V1beta1_MsgTransmit) -> Bool {
    if lhs.transmitter != rhs.transmitter {return false}
    if lhs.configDigest != rhs.configDigest {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs.epoch != rhs.epoch {return false}
    if lhs.round != rhs.round {return false}
    if lhs.extraHash != rhs.extraHash {return false}
    if lhs._report != rhs._report {return false}
    if lhs.signatures != rhs.signatures {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgTransmitResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransmitResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgTransmitResponse, rhs: Injective_Ocr_V1beta1_MsgTransmitResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgFundFeedRewardPool: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgFundFeedRewardPool"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "feed_id"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 2)
    }
    if let v = self._amount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgFundFeedRewardPool, rhs: Injective_Ocr_V1beta1_MsgFundFeedRewardPool) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs._amount != rhs._amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgFundFeedRewardPoolResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgFundFeedRewardPoolResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgFundFeedRewardPoolResponse, rhs: Injective_Ocr_V1beta1_MsgFundFeedRewardPoolResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPool: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawFeedRewardPool"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "feed_id"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 2)
    }
    if let v = self._amount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPool, rhs: Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPool) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs._amount != rhs._amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPoolResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawFeedRewardPoolResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPoolResponse, rhs: Injective_Ocr_V1beta1_MsgWithdrawFeedRewardPoolResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgSetPayees: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetPayees"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "feed_id"),
    3: .same(proto: "transmitters"),
    4: .same(proto: "payees"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.transmitters) }()
      case 4: try { try decoder.decodeRepeatedStringField(value: &self.payees) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 2)
    }
    if !self.transmitters.isEmpty {
      try visitor.visitRepeatedStringField(value: self.transmitters, fieldNumber: 3)
    }
    if !self.payees.isEmpty {
      try visitor.visitRepeatedStringField(value: self.payees, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgSetPayees, rhs: Injective_Ocr_V1beta1_MsgSetPayees) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs.transmitters != rhs.transmitters {return false}
    if lhs.payees != rhs.payees {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgSetPayeesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetPayeesResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgSetPayeesResponse, rhs: Injective_Ocr_V1beta1_MsgSetPayeesResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgTransferPayeeship: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransferPayeeship"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "transmitter"),
    3: .standard(proto: "feed_id"),
    4: .same(proto: "proposed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.transmitter) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.proposed) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.transmitter.isEmpty {
      try visitor.visitSingularStringField(value: self.transmitter, fieldNumber: 2)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 3)
    }
    if !self.proposed.isEmpty {
      try visitor.visitSingularStringField(value: self.proposed, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgTransferPayeeship, rhs: Injective_Ocr_V1beta1_MsgTransferPayeeship) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.transmitter != rhs.transmitter {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs.proposed != rhs.proposed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgTransferPayeeshipResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransferPayeeshipResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgTransferPayeeshipResponse, rhs: Injective_Ocr_V1beta1_MsgTransferPayeeshipResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgAcceptPayeeship: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgAcceptPayeeship"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "payee"),
    2: .same(proto: "transmitter"),
    3: .standard(proto: "feed_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.payee) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.transmitter) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feedID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.payee.isEmpty {
      try visitor.visitSingularStringField(value: self.payee, fieldNumber: 1)
    }
    if !self.transmitter.isEmpty {
      try visitor.visitSingularStringField(value: self.transmitter, fieldNumber: 2)
    }
    if !self.feedID.isEmpty {
      try visitor.visitSingularStringField(value: self.feedID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgAcceptPayeeship, rhs: Injective_Ocr_V1beta1_MsgAcceptPayeeship) -> Bool {
    if lhs.payee != rhs.payee {return false}
    if lhs.transmitter != rhs.transmitter {return false}
    if lhs.feedID != rhs.feedID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Ocr_V1beta1_MsgAcceptPayeeshipResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgAcceptPayeeshipResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Ocr_V1beta1_MsgAcceptPayeeshipResponse, rhs: Injective_Ocr_V1beta1_MsgAcceptPayeeshipResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}