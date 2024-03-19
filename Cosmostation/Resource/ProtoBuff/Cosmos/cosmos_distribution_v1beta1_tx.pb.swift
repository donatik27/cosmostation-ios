// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/distribution/v1beta1/tx.proto
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

/// MsgSetWithdrawAddress sets the withdraw address for
/// a delegator (or validator self-delegation).
struct Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var withdrawAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgSetWithdrawAddressResponse defines the Msg/SetWithdrawAddress response
/// type.
struct Cosmos_Distribution_V1beta1_MsgSetWithdrawAddressResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawDelegatorReward represents delegation withdrawal to a delegator
/// from a single validator.
struct Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var delegatorAddress: String = String()

  var validatorAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawDelegatorRewardResponse defines the Msg/WithdrawDelegatorReward
/// response type.
struct Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorRewardResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Since: cosmos-sdk 0.46
  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawValidatorCommission withdraws the full commission to the validator
/// address.
struct Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var validatorAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawValidatorCommissionResponse defines the
/// Msg/WithdrawValidatorCommission response type.
struct Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommissionResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Since: cosmos-sdk 0.46
  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgFundCommunityPool allows an account to directly
/// fund the community pool.
struct Cosmos_Distribution_V1beta1_MsgFundCommunityPool {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var depositor: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgFundCommunityPoolResponse defines the Msg/FundCommunityPool response type.
struct Cosmos_Distribution_V1beta1_MsgFundCommunityPoolResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
///
/// Since: cosmos-sdk 0.47
struct Cosmos_Distribution_V1beta1_MsgUpdateParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  var authority: String = String()

  /// params defines the x/distribution parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  var params: Cosmos_Distribution_V1beta1_Params {
    get {return _params ?? Cosmos_Distribution_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Cosmos_Distribution_V1beta1_Params? = nil
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
///
/// Since: cosmos-sdk 0.47
struct Cosmos_Distribution_V1beta1_MsgUpdateParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCommunityPoolSpend defines a message for sending tokens from the community
/// pool to another account. This message is typically executed via a governance
/// proposal with the governance module being the executing authority.
///
/// Since: cosmos-sdk 0.47
struct Cosmos_Distribution_V1beta1_MsgCommunityPoolSpend {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  var authority: String = String()

  var recipient: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawTokenizeShareRecordReward withdraws tokenize share rewards for a specific record
struct Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordReward {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ownerAddress: String = String()

  var recordID: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawTokenizeShareRecordReward defines the Msg/WithdrawTokenizeShareRecordReward response type.
struct Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordRewardResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawAllTokenizeShareRecordReward withdraws tokenize share rewards or all
/// records owned by the designated owner
struct Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordReward {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ownerAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawAllTokenizeShareRecordRewardResponse defines the Msg/WithdrawTokenizeShareRecordReward response type.
struct Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordRewardResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCommunityPoolSpendResponse defines the response to executing a
/// MsgCommunityPoolSpend message.
///
/// Since: cosmos-sdk 0.47
struct Cosmos_Distribution_V1beta1_MsgCommunityPoolSpendResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgSetWithdrawAddressResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorRewardResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommissionResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgFundCommunityPool: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgFundCommunityPoolResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgUpdateParams: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgUpdateParamsResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgCommunityPoolSpend: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordReward: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordRewardResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordReward: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordRewardResponse: @unchecked Sendable {}
extension Cosmos_Distribution_V1beta1_MsgCommunityPoolSpendResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.distribution.v1beta1"

extension Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetWithdrawAddress"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "withdraw_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.withdrawAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.withdrawAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.withdrawAddress, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress, rhs: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.withdrawAddress != rhs.withdrawAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgSetWithdrawAddressResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSetWithdrawAddressResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddressResponse, rhs: Cosmos_Distribution_V1beta1_MsgSetWithdrawAddressResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawDelegatorReward"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.delegatorAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorRewardResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawDelegatorRewardResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorRewardResponse, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorRewardResponse) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawValidatorCommission"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.validatorAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission) -> Bool {
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommissionResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawValidatorCommissionResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommissionResponse, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommissionResponse) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgFundCommunityPool: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgFundCommunityPool"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .same(proto: "depositor"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.depositor) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 1)
    }
    if !self.depositor.isEmpty {
      try visitor.visitSingularStringField(value: self.depositor, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgFundCommunityPool, rhs: Cosmos_Distribution_V1beta1_MsgFundCommunityPool) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.depositor != rhs.depositor {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgFundCommunityPoolResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgFundCommunityPoolResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgFundCommunityPoolResponse, rhs: Cosmos_Distribution_V1beta1_MsgFundCommunityPoolResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgUpdateParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authority"),
    2: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.authority) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.authority.isEmpty {
      try visitor.visitSingularStringField(value: self.authority, fieldNumber: 1)
    }
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgUpdateParams, rhs: Cosmos_Distribution_V1beta1_MsgUpdateParams) -> Bool {
    if lhs.authority != rhs.authority {return false}
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgUpdateParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateParamsResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgUpdateParamsResponse, rhs: Cosmos_Distribution_V1beta1_MsgUpdateParamsResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgCommunityPoolSpend: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCommunityPoolSpend"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "authority"),
    2: .same(proto: "recipient"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.authority) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.authority.isEmpty {
      try visitor.visitSingularStringField(value: self.authority, fieldNumber: 1)
    }
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgCommunityPoolSpend, rhs: Cosmos_Distribution_V1beta1_MsgCommunityPoolSpend) -> Bool {
    if lhs.authority != rhs.authority {return false}
    if lhs.recipient != rhs.recipient {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordReward: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawTokenizeShareRecordReward"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "owner_address"),
    2: .standard(proto: "record_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.ownerAddress) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.recordID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.ownerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.ownerAddress, fieldNumber: 1)
    }
    if self.recordID != 0 {
      try visitor.visitSingularUInt64Field(value: self.recordID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordReward, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordReward) -> Bool {
    if lhs.ownerAddress != rhs.ownerAddress {return false}
    if lhs.recordID != rhs.recordID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordRewardResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawTokenizeShareRecordRewardResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordRewardResponse, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawTokenizeShareRecordRewardResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordReward: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawAllTokenizeShareRecordReward"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "owner_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.ownerAddress) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.ownerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.ownerAddress, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordReward, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordReward) -> Bool {
    if lhs.ownerAddress != rhs.ownerAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordRewardResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawAllTokenizeShareRecordRewardResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordRewardResponse, rhs: Cosmos_Distribution_V1beta1_MsgWithdrawAllTokenizeShareRecordRewardResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_MsgCommunityPoolSpendResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCommunityPoolSpendResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_MsgCommunityPoolSpendResponse, rhs: Cosmos_Distribution_V1beta1_MsgCommunityPoolSpendResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
