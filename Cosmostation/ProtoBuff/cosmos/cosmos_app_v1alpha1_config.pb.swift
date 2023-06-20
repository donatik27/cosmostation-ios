// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/app/v1alpha1/config.proto
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

/// Config represents the configuration for a Cosmos SDK ABCI app.
/// It is intended that all state machine logic including the version of
/// baseapp and tx handlers (and possibly even Tendermint) that an app needs
/// can be described in a config object. For compatibility, the framework should
/// allow a mixture of declarative and imperative app wiring, however, apps
/// that strive for the maximum ease of maintainability should be able to describe
/// their state machine with a config object alone.
struct Cosmos_App_V1alpha1_Config {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// modules are the module configurations for the app.
  var modules: [Cosmos_App_V1alpha1_ModuleConfig] = []

  /// golang_bindings specifies explicit interface to implementation type bindings which
  /// depinject uses to resolve interface inputs to provider functions.  The scope of this
  /// field's configuration is global (not module specific).
  var golangBindings: [Cosmos_App_V1alpha1_GolangBinding] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ModuleConfig is a module configuration for an app.
struct Cosmos_App_V1alpha1_ModuleConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// name is the unique name of the module within the app. It should be a name
  /// that persists between different versions of a module so that modules
  /// can be smoothly upgraded to new versions.
  ///
  /// For example, for the module cosmos.bank.module.v1.Module, we may chose
  /// to simply name the module "bank" in the app. When we upgrade to
  /// cosmos.bank.module.v2.Module, the app-specific name "bank" stays the same
  /// and the framework knows that the v2 module should receive all the same state
  /// that the v1 module had. Note: modules should provide info on which versions
  /// they can migrate from in the ModuleDescriptor.can_migration_from field.
  var name: String = String()

  /// config is the config object for the module. Module config messages should
  /// define a ModuleDescriptor using the cosmos.app.v1alpha1.is_module extension.
  var config: SwiftProtobuf.Google_Protobuf_Any {
    get {return _config ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_config = newValue}
  }
  /// Returns true if `config` has been explicitly set.
  var hasConfig: Bool {return self._config != nil}
  /// Clears the value of `config`. Subsequent reads from it will return its default value.
  mutating func clearConfig() {self._config = nil}

  /// golang_bindings specifies explicit interface to implementation type bindings which
  /// depinject uses to resolve interface inputs to provider functions.  The scope of this
  /// field's configuration is module specific.
  var golangBindings: [Cosmos_App_V1alpha1_GolangBinding] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _config: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// GolangBinding is an explicit interface type to implementing type binding for dependency injection.
struct Cosmos_App_V1alpha1_GolangBinding {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// interface_type is the interface type which will be bound to a specific implementation type
  var interfaceType: String = String()

  /// implementation is the implementing type which will be supplied when an input of type interface is requested
  var implementation: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_App_V1alpha1_Config: @unchecked Sendable {}
extension Cosmos_App_V1alpha1_ModuleConfig: @unchecked Sendable {}
extension Cosmos_App_V1alpha1_GolangBinding: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.app.v1alpha1"

extension Cosmos_App_V1alpha1_Config: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Config"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "modules"),
    2: .standard(proto: "golang_bindings"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.modules) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.golangBindings) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.modules.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.modules, fieldNumber: 1)
    }
    if !self.golangBindings.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.golangBindings, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_Config, rhs: Cosmos_App_V1alpha1_Config) -> Bool {
    if lhs.modules != rhs.modules {return false}
    if lhs.golangBindings != rhs.golangBindings {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_App_V1alpha1_ModuleConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ModuleConfig"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "config"),
    3: .standard(proto: "golang_bindings"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._config) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.golangBindings) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    try { if let v = self._config {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.golangBindings.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.golangBindings, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_ModuleConfig, rhs: Cosmos_App_V1alpha1_ModuleConfig) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs._config != rhs._config {return false}
    if lhs.golangBindings != rhs.golangBindings {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_App_V1alpha1_GolangBinding: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GolangBinding"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "interface_type"),
    2: .same(proto: "implementation"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.interfaceType) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.implementation) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.interfaceType.isEmpty {
      try visitor.visitSingularStringField(value: self.interfaceType, fieldNumber: 1)
    }
    if !self.implementation.isEmpty {
      try visitor.visitSingularStringField(value: self.implementation, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_App_V1alpha1_GolangBinding, rhs: Cosmos_App_V1alpha1_GolangBinding) -> Bool {
    if lhs.interfaceType != rhs.interfaceType {return false}
    if lhs.implementation != rhs.implementation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
