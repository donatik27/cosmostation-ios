// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/subspaces/v1beta1/subspace.proto
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

/// SubspaceType contains all the possible subspace types
enum Desmos_Subspaces_V1beta1_SubspaceType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// SubspaceTypeUnspecified identifies an unspecified type of subspace (used in
  /// errors)
  case unspecified // = 0

  /// SubspaceTypeOpen identifies that users can interact inside the subspace
  /// without the need to being registered in it
  case `open` // = 1

  /// SubspaceTypeClosed identifies that users can't interact inside the subspace
  /// without being registered in it
  case closed // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .open
    case 2: self = .closed
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .open: return 1
    case .closed: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Desmos_Subspaces_V1beta1_SubspaceType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Desmos_Subspaces_V1beta1_SubspaceType] = [
    .unspecified,
    .open,
    .closed,
  ]
}

#endif  // swift(>=4.2)

/// Subspace contains all the data of a Desmos subspace
struct Desmos_Subspaces_V1beta1_Subspace {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// unique SHA-256 string that identifies the subspace
  var id: String = String()

  /// human readable name of the subspace
  var name: String = String()

  /// the address of the user that owns the subspace
  var owner: String = String()

  /// the address of the subspace creator
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

  /// the type of the subspace that indicates if it need registration or not
  var type: Desmos_Subspaces_V1beta1_SubspaceType = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _creationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.subspaces.v1beta1"

extension Desmos_Subspaces_V1beta1_SubspaceType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SUBSPACE_TYPE_UNSPECIFIED"),
    1: .same(proto: "SUBSPACE_TYPE_OPEN"),
    2: .same(proto: "SUBSPACE_TYPE_CLOSED"),
  ]
}

extension Desmos_Subspaces_V1beta1_Subspace: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Subspace"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "owner"),
    4: .same(proto: "creator"),
    5: .standard(proto: "creation_time"),
    6: .same(proto: "type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.creator) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._creationTime) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.type) }()
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
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 3)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 4)
    }
    if let v = self._creationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if self.type != .unspecified {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V1beta1_Subspace, rhs: Desmos_Subspaces_V1beta1_Subspace) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs._creationTime != rhs._creationTime {return false}
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}