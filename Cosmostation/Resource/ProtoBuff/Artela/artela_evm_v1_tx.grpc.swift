//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: artela/evm/v1/tx.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Msg defines the evm Msg service.
///
/// Usage: instantiate `Artela_Evm_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Artela_Evm_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? { get }

  func ethereumTx(
    _ request: Artela_Evm_V1_MsgEthereumTx,
    callOptions: CallOptions?
  ) -> UnaryCall<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse>

  func updateParams(
    _ request: Artela_Evm_V1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> UnaryCall<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse>
}

extension Artela_Evm_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "artela.evm.v1.Msg"
  }

  /// EthereumTx defines a method submitting Ethereum transactions.
  ///
  /// - Parameters:
  ///   - request: Request to send to EthereumTx.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func ethereumTx(
    _ request: Artela_Evm_V1_MsgEthereumTx,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse> {
    return self.makeUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.ethereumTx.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEthereumTxInterceptors() ?? []
    )
  }

  /// UpdateParams defined a governance operation for updating the x/evm module parameters.
  /// The authority is hard-coded to the Cosmos SDK x/gov module account
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateParams(
    _ request: Artela_Evm_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse> {
    return self.makeUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Artela_Evm_V1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Artela_Evm_V1_MsgNIOClient")
internal final class Artela_Evm_V1_MsgClient: Artela_Evm_V1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the artela.evm.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Artela_Evm_V1_MsgNIOClient: Artela_Evm_V1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the artela.evm.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the evm Msg service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Artela_Evm_V1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? { get }

  func makeEthereumTxCall(
    _ request: Artela_Evm_V1_MsgEthereumTx,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse>

  func makeUpdateParamsCall(
    _ request: Artela_Evm_V1_MsgUpdateParams,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Artela_Evm_V1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Artela_Evm_V1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeEthereumTxCall(
    _ request: Artela_Evm_V1_MsgEthereumTx,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse> {
    return self.makeAsyncUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.ethereumTx.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEthereumTxInterceptors() ?? []
    )
  }

  internal func makeUpdateParamsCall(
    _ request: Artela_Evm_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Artela_Evm_V1_MsgAsyncClientProtocol {
  internal func ethereumTx(
    _ request: Artela_Evm_V1_MsgEthereumTx,
    callOptions: CallOptions? = nil
  ) async throws -> Artela_Evm_V1_MsgEthereumTxResponse {
    return try await self.performAsyncUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.ethereumTx.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEthereumTxInterceptors() ?? []
    )
  }

  internal func updateParams(
    _ request: Artela_Evm_V1_MsgUpdateParams,
    callOptions: CallOptions? = nil
  ) async throws -> Artela_Evm_V1_MsgUpdateParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Artela_Evm_V1_MsgClientMetadata.Methods.updateParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Artela_Evm_V1_MsgAsyncClient: Artela_Evm_V1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Artela_Evm_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Artela_Evm_V1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'ethereumTx'.
  func makeEthereumTxInterceptors() -> [ClientInterceptor<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse>]

  /// - Returns: Interceptors to use when invoking 'updateParams'.
  func makeUpdateParamsInterceptors() -> [ClientInterceptor<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse>]
}

internal enum Artela_Evm_V1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "artela.evm.v1.Msg",
    methods: [
      Artela_Evm_V1_MsgClientMetadata.Methods.ethereumTx,
      Artela_Evm_V1_MsgClientMetadata.Methods.updateParams,
    ]
  )

  internal enum Methods {
    internal static let ethereumTx = GRPCMethodDescriptor(
      name: "EthereumTx",
      path: "/artela.evm.v1.Msg/EthereumTx",
      type: GRPCCallType.unary
    )

    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/artela.evm.v1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the evm Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Artela_Evm_V1_MsgProvider: CallHandlerProvider {
  var interceptors: Artela_Evm_V1_MsgServerInterceptorFactoryProtocol? { get }

  /// EthereumTx defines a method submitting Ethereum transactions.
  func ethereumTx(request: Artela_Evm_V1_MsgEthereumTx, context: StatusOnlyCallContext) -> EventLoopFuture<Artela_Evm_V1_MsgEthereumTxResponse>

  /// UpdateParams defined a governance operation for updating the x/evm module parameters.
  /// The authority is hard-coded to the Cosmos SDK x/gov module account
  func updateParams(request: Artela_Evm_V1_MsgUpdateParams, context: StatusOnlyCallContext) -> EventLoopFuture<Artela_Evm_V1_MsgUpdateParamsResponse>
}

extension Artela_Evm_V1_MsgProvider {
  internal var serviceName: Substring {
    return Artela_Evm_V1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "EthereumTx":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Artela_Evm_V1_MsgEthereumTx>(),
        responseSerializer: ProtobufSerializer<Artela_Evm_V1_MsgEthereumTxResponse>(),
        interceptors: self.interceptors?.makeEthereumTxInterceptors() ?? [],
        userFunction: self.ethereumTx(request:context:)
      )

    case "UpdateParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Artela_Evm_V1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Artela_Evm_V1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        userFunction: self.updateParams(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the evm Msg service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Artela_Evm_V1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Artela_Evm_V1_MsgServerInterceptorFactoryProtocol? { get }

  /// EthereumTx defines a method submitting Ethereum transactions.
  @Sendable func ethereumTx(
    request: Artela_Evm_V1_MsgEthereumTx,
    context: GRPCAsyncServerCallContext
  ) async throws -> Artela_Evm_V1_MsgEthereumTxResponse

  /// UpdateParams defined a governance operation for updating the x/evm module parameters.
  /// The authority is hard-coded to the Cosmos SDK x/gov module account
  @Sendable func updateParams(
    request: Artela_Evm_V1_MsgUpdateParams,
    context: GRPCAsyncServerCallContext
  ) async throws -> Artela_Evm_V1_MsgUpdateParamsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Artela_Evm_V1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Artela_Evm_V1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Artela_Evm_V1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Artela_Evm_V1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "EthereumTx":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Artela_Evm_V1_MsgEthereumTx>(),
        responseSerializer: ProtobufSerializer<Artela_Evm_V1_MsgEthereumTxResponse>(),
        interceptors: self.interceptors?.makeEthereumTxInterceptors() ?? [],
        wrapping: self.ethereumTx(request:context:)
      )

    case "UpdateParams":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Artela_Evm_V1_MsgUpdateParams>(),
        responseSerializer: ProtobufSerializer<Artela_Evm_V1_MsgUpdateParamsResponse>(),
        interceptors: self.interceptors?.makeUpdateParamsInterceptors() ?? [],
        wrapping: self.updateParams(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Artela_Evm_V1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'ethereumTx'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEthereumTxInterceptors() -> [ServerInterceptor<Artela_Evm_V1_MsgEthereumTx, Artela_Evm_V1_MsgEthereumTxResponse>]

  /// - Returns: Interceptors to use when handling 'updateParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateParamsInterceptors() -> [ServerInterceptor<Artela_Evm_V1_MsgUpdateParams, Artela_Evm_V1_MsgUpdateParamsResponse>]
}

internal enum Artela_Evm_V1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "artela.evm.v1.Msg",
    methods: [
      Artela_Evm_V1_MsgServerMetadata.Methods.ethereumTx,
      Artela_Evm_V1_MsgServerMetadata.Methods.updateParams,
    ]
  )

  internal enum Methods {
    internal static let ethereumTx = GRPCMethodDescriptor(
      name: "EthereumTx",
      path: "/artela.evm.v1.Msg/EthereumTx",
      type: GRPCCallType.unary
    )

    internal static let updateParams = GRPCMethodDescriptor(
      name: "UpdateParams",
      path: "/artela.evm.v1.Msg/UpdateParams",
      type: GRPCCallType.unary
    )
  }
}
