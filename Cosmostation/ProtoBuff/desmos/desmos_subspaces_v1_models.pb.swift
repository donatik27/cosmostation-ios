// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/subspaces/v1/models.proto
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

/// Subspace contains all the data of a Desmos subspace
struct Desmos_Subspaces_V1_Subspace {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Unique id that identifies the subspace
  var id: UInt64 = 0

  /// Human-readable name of the subspace
  var name: String = String()

  /// Optional description of this subspace
  var description_p: String = String()

  /// Represents the account that is associated with the subspace and
  /// should be used to connect external applications to verify this subspace
  var treasury: String = String()

  /// Address of the user that owns the subspace
  var owner: String = String()

  /// Address of the subspace creator
  var creator: String = String()

  /// the creation time of the subspace
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

  fileprivate var _creationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// UserGroup represents a group of users
struct Desmos_Subspaces_V1_UserGroup {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID of the subspace inside which this group exists
  var subspaceID: UInt64 = 0

  /// Unique id that identifies the group
  var id: UInt32 = 0

  /// Human-readable name of the user group
  var name: String = String()

  /// Optional description of this group
  var description_p: String = String()

  /// Permissions that will be granted to all the users part of this group
  var permissions: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// PermissionDetail contains the details data of a permission
struct Desmos_Subspaces_V1_PermissionDetail {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// sum is the oneof that specifies whether this represents a user or
  /// group permission detail
  var sum: Desmos_Subspaces_V1_PermissionDetail.OneOf_Sum? = nil

  /// User represents a user permission
  var user: Desmos_Subspaces_V1_PermissionDetail.User {
    get {
      if case .user(let v)? = sum {return v}
      return Desmos_Subspaces_V1_PermissionDetail.User()
    }
    set {sum = .user(newValue)}
  }

  /// Group represents a group permission
  var group: Desmos_Subspaces_V1_PermissionDetail.Group {
    get {
      if case .group(let v)? = sum {return v}
      return Desmos_Subspaces_V1_PermissionDetail.Group()
    }
    set {sum = .group(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// sum is the oneof that specifies whether this represents a user or
  /// group permission detail
  enum OneOf_Sum: Equatable {
    /// User represents a user permission
    case user(Desmos_Subspaces_V1_PermissionDetail.User)
    /// Group represents a group permission
    case group(Desmos_Subspaces_V1_PermissionDetail.Group)

  #if !swift(>=4.1)
    static func ==(lhs: Desmos_Subspaces_V1_PermissionDetail.OneOf_Sum, rhs: Desmos_Subspaces_V1_PermissionDetail.OneOf_Sum) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.user, .user): return {
        guard case .user(let l) = lhs, case .user(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.group, .group): return {
        guard case .group(let l) = lhs, case .group(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  /// User is a permission that has been set to a specific user
  struct User {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// User for which the permission was set
    var user: String = String()

    /// Permission set to the user
    var permission: UInt32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Group is a permission that has been set to a user group
  struct Group {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Unique id of the group
    var groupID: UInt32 = 0

    /// Permission set to the group
    var permission: UInt32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Desmos_Subspaces_V1_Subspace: @unchecked Sendable {}
extension Desmos_Subspaces_V1_UserGroup: @unchecked Sendable {}
extension Desmos_Subspaces_V1_PermissionDetail: @unchecked Sendable {}
extension Desmos_Subspaces_V1_PermissionDetail.OneOf_Sum: @unchecked Sendable {}
extension Desmos_Subspaces_V1_PermissionDetail.User: @unchecked Sendable {}
extension Desmos_Subspaces_V1_PermissionDetail.Group: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.subspaces.v1"

extension Desmos_Subspaces_V1_Subspace: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Subspace"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "description"),
    4: .same(proto: "treasury"),
    5: .same(proto: "owner"),
    6: .same(proto: "creator"),
    7: .standard(proto: "creation_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.treasury) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._creationTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    if !self.treasury.isEmpty {
      try visitor.visitSingularStringField(value: self.treasury, fieldNumber: 4)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 5)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 6)
    }
    try { if let v = self._creationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1_Subspace, rhs: Desmos_Subspaces_V1_Subspace) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.treasury != rhs.treasury {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs._creationTime != rhs._creationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V1_UserGroup: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGroup"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .same(proto: "id"),
    3: .same(proto: "name"),
    4: .same(proto: "description"),
    5: .same(proto: "permissions"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.id) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 5: try { try decoder.decodeSingularUInt32Field(value: &self.permissions) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if self.id != 0 {
      try visitor.visitSingularUInt32Field(value: self.id, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 4)
    }
    if self.permissions != 0 {
      try visitor.visitSingularUInt32Field(value: self.permissions, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1_UserGroup, rhs: Desmos_Subspaces_V1_UserGroup) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.permissions != rhs.permissions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V1_PermissionDetail: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PermissionDetail"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "group"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Desmos_Subspaces_V1_PermissionDetail.User?
        var hadOneofValue = false
        if let current = self.sum {
          hadOneofValue = true
          if case .user(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sum = .user(v)
        }
      }()
      case 2: try {
        var v: Desmos_Subspaces_V1_PermissionDetail.Group?
        var hadOneofValue = false
        if let current = self.sum {
          hadOneofValue = true
          if case .group(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sum = .group(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    switch self.sum {
    case .user?: try {
      guard case .user(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .group?: try {
      guard case .group(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1_PermissionDetail, rhs: Desmos_Subspaces_V1_PermissionDetail) -> Bool {
    if lhs.sum != rhs.sum {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V1_PermissionDetail.User: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Desmos_Subspaces_V1_PermissionDetail.protoMessageName + ".User"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "permission"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.user) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.permission) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    if self.permission != 0 {
      try visitor.visitSingularUInt32Field(value: self.permission, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1_PermissionDetail.User, rhs: Desmos_Subspaces_V1_PermissionDetail.User) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs.permission != rhs.permission {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V1_PermissionDetail.Group: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Desmos_Subspaces_V1_PermissionDetail.protoMessageName + ".Group"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "group_id"),
    2: .same(proto: "permission"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.groupID) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.permission) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.groupID != 0 {
      try visitor.visitSingularUInt32Field(value: self.groupID, fieldNumber: 1)
    }
    if self.permission != 0 {
      try visitor.visitSingularUInt32Field(value: self.permission, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1_PermissionDetail.Group, rhs: Desmos_Subspaces_V1_PermissionDetail.Group) -> Bool {
    if lhs.groupID != rhs.groupID {return false}
    if lhs.permission != rhs.permission {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
