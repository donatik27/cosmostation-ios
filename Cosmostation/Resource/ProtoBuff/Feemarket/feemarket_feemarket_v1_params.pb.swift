// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: feemarket/feemarket/v1/params.proto
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

/// Params contains the required set of parameters for the EIP1559 fee market
/// plugin implementation.
struct Feemarket_Feemarket_V1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Alpha is the amount we additively increase the learning rate
  /// when it is above or below the target +/- threshold.
  ///
  /// Must be > 0.
  var alpha: String = String()

  /// Beta is the amount we multiplicatively decrease the learning rate
  /// when it is within the target +/- threshold.
  ///
  /// Must be [0, 1].
  var beta: String = String()

  /// Gamma is the threshold for the learning rate. If the learning rate is
  /// above or below the target +/- threshold, we additively increase the
  /// learning rate by Alpha. Otherwise, we multiplicatively decrease the
  /// learning rate by Beta.
  ///
  /// Must be [0, 0.5].
  var gamma: String = String()

  /// Delta is the amount we additively increase/decrease the gas price when the
  /// net block utilization difference in the window is above/below the target
  /// utilization.
  var delta: String = String()

  /// MinBaseGasPrice determines the initial gas price of the module and the
  /// global minimum for the network.
  var minBaseGasPrice: String = String()

  /// MinLearningRate is the lower bound for the learning rate.
  var minLearningRate: String = String()

  /// MaxLearningRate is the upper bound for the learning rate.
  var maxLearningRate: String = String()

  /// MaxBlockUtilization is the maximum block utilization.
  var maxBlockUtilization: UInt64 = 0

  /// Window defines the window size for calculating an adaptive learning rate
  /// over a moving window of blocks.
  var window: UInt64 = 0

  /// FeeDenom is the denom that will be used for all fee payments.
  var feeDenom: String = String()

  /// Enabled is a boolean that determines whether the EIP1559 fee market is
  /// enabled.
  var enabled: Bool = false

  /// DistributeFees is a boolean that determines whether the fees are burned or
  /// distributed to all stakers.
  var distributeFees: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Feemarket_Feemarket_V1_Params: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "feemarket.feemarket.v1"

extension Feemarket_Feemarket_V1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "alpha"),
    2: .same(proto: "beta"),
    3: .same(proto: "gamma"),
    4: .same(proto: "delta"),
    5: .standard(proto: "min_base_gas_price"),
    6: .standard(proto: "min_learning_rate"),
    7: .standard(proto: "max_learning_rate"),
    8: .standard(proto: "max_block_utilization"),
    9: .same(proto: "window"),
    10: .standard(proto: "fee_denom"),
    11: .same(proto: "enabled"),
    12: .standard(proto: "distribute_fees"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.alpha) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.beta) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.gamma) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.delta) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.minBaseGasPrice) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.minLearningRate) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.maxLearningRate) }()
      case 8: try { try decoder.decodeSingularUInt64Field(value: &self.maxBlockUtilization) }()
      case 9: try { try decoder.decodeSingularUInt64Field(value: &self.window) }()
      case 10: try { try decoder.decodeSingularStringField(value: &self.feeDenom) }()
      case 11: try { try decoder.decodeSingularBoolField(value: &self.enabled) }()
      case 12: try { try decoder.decodeSingularBoolField(value: &self.distributeFees) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.alpha.isEmpty {
      try visitor.visitSingularStringField(value: self.alpha, fieldNumber: 1)
    }
    if !self.beta.isEmpty {
      try visitor.visitSingularStringField(value: self.beta, fieldNumber: 2)
    }
    if !self.gamma.isEmpty {
      try visitor.visitSingularStringField(value: self.gamma, fieldNumber: 3)
    }
    if !self.delta.isEmpty {
      try visitor.visitSingularStringField(value: self.delta, fieldNumber: 4)
    }
    if !self.minBaseGasPrice.isEmpty {
      try visitor.visitSingularStringField(value: self.minBaseGasPrice, fieldNumber: 5)
    }
    if !self.minLearningRate.isEmpty {
      try visitor.visitSingularStringField(value: self.minLearningRate, fieldNumber: 6)
    }
    if !self.maxLearningRate.isEmpty {
      try visitor.visitSingularStringField(value: self.maxLearningRate, fieldNumber: 7)
    }
    if self.maxBlockUtilization != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxBlockUtilization, fieldNumber: 8)
    }
    if self.window != 0 {
      try visitor.visitSingularUInt64Field(value: self.window, fieldNumber: 9)
    }
    if !self.feeDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.feeDenom, fieldNumber: 10)
    }
    if self.enabled != false {
      try visitor.visitSingularBoolField(value: self.enabled, fieldNumber: 11)
    }
    if self.distributeFees != false {
      try visitor.visitSingularBoolField(value: self.distributeFees, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Feemarket_Feemarket_V1_Params, rhs: Feemarket_Feemarket_V1_Params) -> Bool {
    if lhs.alpha != rhs.alpha {return false}
    if lhs.beta != rhs.beta {return false}
    if lhs.gamma != rhs.gamma {return false}
    if lhs.delta != rhs.delta {return false}
    if lhs.minBaseGasPrice != rhs.minBaseGasPrice {return false}
    if lhs.minLearningRate != rhs.minLearningRate {return false}
    if lhs.maxLearningRate != rhs.maxLearningRate {return false}
    if lhs.maxBlockUtilization != rhs.maxBlockUtilization {return false}
    if lhs.window != rhs.window {return false}
    if lhs.feeDenom != rhs.feeDenom {return false}
    if lhs.enabled != rhs.enabled {return false}
    if lhs.distributeFees != rhs.distributeFees {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}