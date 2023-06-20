// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/reports/v1/msgs.proto
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

/// MsgCreateReport represents the message to be used to create a report
struct Desmos_Reports_V1_MsgCreateReport {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace for which the report should be stored
  var subspaceID: UInt64 = 0

  /// Id of the reason this report has been created for
  var reasonsIds: [UInt32] = []

  /// (optional) Message attached to this report
  var message: String = String()

  /// Address of the reporter
  var reporter: String = String()

  /// Target of the report
  var target: SwiftProtobuf.Google_Protobuf_Any {
    get {return _target ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_target = newValue}
  }
  /// Returns true if `target` has been explicitly set.
  var hasTarget: Bool {return self._target != nil}
  /// Clears the value of `target`. Subsequent reads from it will return its default value.
  mutating func clearTarget() {self._target = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _target: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// MsgCreateReportResponse represents the Msg/CreateReport response type
struct Desmos_Reports_V1_MsgCreateReportResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the newly created report
  var reportID: UInt64 = 0

  /// Time in which the report was created
  var creationDate: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _creationDate ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_creationDate = newValue}
  }
  /// Returns true if `creationDate` has been explicitly set.
  var hasCreationDate: Bool {return self._creationDate != nil}
  /// Clears the value of `creationDate`. Subsequent reads from it will return its default value.
  mutating func clearCreationDate() {self._creationDate = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _creationDate: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// MsgDeleteReport represents the message to be used when deleting a report
struct Desmos_Reports_V1_MsgDeleteReport {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace that contains the report to be deleted
  var subspaceID: UInt64 = 0

  /// Id of the report to be deleted
  var reportID: UInt64 = 0

  /// Address of the user deleting the report
  var signer: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDeleteReportResponse represents the Msg/DeleteReport response type
struct Desmos_Reports_V1_MsgDeleteReportResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgSupportStandardReason represents the message to be used when wanting to
/// support one reason from the module params
struct Desmos_Reports_V1_MsgSupportStandardReason {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace for which to support the reason
  var subspaceID: UInt64 = 0

  /// Id of the reason that should be supported
  var standardReasonID: UInt32 = 0

  /// Address of the user signing the message
  var signer: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgSupportStandardReasonResponse represents the Msg/SupportStandardReason
/// response type
struct Desmos_Reports_V1_MsgSupportStandardReasonResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the newly added reason
  var reasonsIds: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgAddReason represents the message to be used when adding a new supported
/// reason
struct Desmos_Reports_V1_MsgAddReason {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace for which to add the reason
  var subspaceID: UInt64 = 0

  /// Title of the reason
  var title: String = String()

  /// (optional) Extended description of the reason and the cases it applies to
  var description_p: String = String()

  /// Address of the user adding the supported reason
  var signer: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgAddReasonResponse represents the Msg/AddReason response type
struct Desmos_Reports_V1_MsgAddReasonResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the newly supported reason
  var reasonID: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRemoveReason represents the message to be used when removing an exiting
/// reporting reason
struct Desmos_Reports_V1_MsgRemoveReason {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace from which to remove the reason
  var subspaceID: UInt64 = 0

  /// Id of the reason to be deleted
  var reasonID: UInt32 = 0

  /// Address of the user adding the supported reason
  var signer: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRemoveReasonResponse represents the Msg/RemoveReason response type
struct Desmos_Reports_V1_MsgRemoveReasonResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
///
/// Since: Desmos 5.0.0
struct Desmos_Reports_V1_MsgUpdateParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// authority is the address that controls the module (defaults to x/gov unless
  /// overwritten).
  var authority: String = String()

  /// params defines the parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  var params: Desmos_Reports_V1_Params {
    get {return _params ?? Desmos_Reports_V1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Desmos_Reports_V1_Params? = nil
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
///
/// Since: Desmos 5.0.0
struct Desmos_Reports_V1_MsgUpdateParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Desmos_Reports_V1_MsgCreateReport: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgCreateReportResponse: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgDeleteReport: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgDeleteReportResponse: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgSupportStandardReason: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgSupportStandardReasonResponse: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgAddReason: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgAddReasonResponse: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgRemoveReason: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgRemoveReasonResponse: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgUpdateParams: @unchecked Sendable {}
extension Desmos_Reports_V1_MsgUpdateParamsResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.reports.v1"

extension Desmos_Reports_V1_MsgCreateReport: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateReport"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .standard(proto: "reasons_ids"),
    3: .same(proto: "message"),
    4: .same(proto: "reporter"),
    5: .same(proto: "target"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeRepeatedUInt32Field(value: &self.reasonsIds) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.message) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.reporter) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._target) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if !self.reasonsIds.isEmpty {
      try visitor.visitPackedUInt32Field(value: self.reasonsIds, fieldNumber: 2)
    }
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 3)
    }
    if !self.reporter.isEmpty {
      try visitor.visitSingularStringField(value: self.reporter, fieldNumber: 4)
    }
    try { if let v = self._target {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgCreateReport, rhs: Desmos_Reports_V1_MsgCreateReport) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.reasonsIds != rhs.reasonsIds {return false}
    if lhs.message != rhs.message {return false}
    if lhs.reporter != rhs.reporter {return false}
    if lhs._target != rhs._target {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgCreateReportResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateReportResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "report_id"),
    2: .standard(proto: "creation_date"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.reportID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._creationDate) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.reportID != 0 {
      try visitor.visitSingularUInt64Field(value: self.reportID, fieldNumber: 1)
    }
    try { if let v = self._creationDate {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgCreateReportResponse, rhs: Desmos_Reports_V1_MsgCreateReportResponse) -> Bool {
    if lhs.reportID != rhs.reportID {return false}
    if lhs._creationDate != rhs._creationDate {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgDeleteReport: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDeleteReport"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .standard(proto: "report_id"),
    3: .same(proto: "signer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.reportID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if self.reportID != 0 {
      try visitor.visitSingularUInt64Field(value: self.reportID, fieldNumber: 2)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgDeleteReport, rhs: Desmos_Reports_V1_MsgDeleteReport) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.reportID != rhs.reportID {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgDeleteReportResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDeleteReportResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgDeleteReportResponse, rhs: Desmos_Reports_V1_MsgDeleteReportResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgSupportStandardReason: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSupportStandardReason"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .standard(proto: "standard_reason_id"),
    3: .same(proto: "signer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.standardReasonID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if self.standardReasonID != 0 {
      try visitor.visitSingularUInt32Field(value: self.standardReasonID, fieldNumber: 2)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgSupportStandardReason, rhs: Desmos_Reports_V1_MsgSupportStandardReason) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.standardReasonID != rhs.standardReasonID {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgSupportStandardReasonResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSupportStandardReasonResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "reasons_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.reasonsIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.reasonsIds != 0 {
      try visitor.visitSingularUInt32Field(value: self.reasonsIds, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgSupportStandardReasonResponse, rhs: Desmos_Reports_V1_MsgSupportStandardReasonResponse) -> Bool {
    if lhs.reasonsIds != rhs.reasonsIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgAddReason: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgAddReason"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .same(proto: "title"),
    3: .same(proto: "description"),
    4: .same(proto: "signer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgAddReason, rhs: Desmos_Reports_V1_MsgAddReason) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgAddReasonResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgAddReasonResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "reason_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.reasonID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.reasonID != 0 {
      try visitor.visitSingularUInt32Field(value: self.reasonID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgAddReasonResponse, rhs: Desmos_Reports_V1_MsgAddReasonResponse) -> Bool {
    if lhs.reasonID != rhs.reasonID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgRemoveReason: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRemoveReason"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .standard(proto: "reason_id"),
    3: .same(proto: "signer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.reasonID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.signer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if self.reasonID != 0 {
      try visitor.visitSingularUInt32Field(value: self.reasonID, fieldNumber: 2)
    }
    if !self.signer.isEmpty {
      try visitor.visitSingularStringField(value: self.signer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgRemoveReason, rhs: Desmos_Reports_V1_MsgRemoveReason) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.reasonID != rhs.reasonID {return false}
    if lhs.signer != rhs.signer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgRemoveReasonResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRemoveReasonResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgRemoveReasonResponse, rhs: Desmos_Reports_V1_MsgRemoveReasonResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgUpdateParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
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

  static func ==(lhs: Desmos_Reports_V1_MsgUpdateParams, rhs: Desmos_Reports_V1_MsgUpdateParams) -> Bool {
    if lhs.authority != rhs.authority {return false}
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Reports_V1_MsgUpdateParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateParamsResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Reports_V1_MsgUpdateParamsResponse, rhs: Desmos_Reports_V1_MsgUpdateParamsResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
