//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: ibc/core/connection/v1/query.proto
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


/// Query provides defines the gRPC querier service
///
/// Usage: instantiate `Ibc_Core_Connection_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Ibc_Core_Connection_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? { get }

  func connection(
    _ request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse>

  func connections(
    _ request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse>

  func clientConnections(
    _ request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse>

  func connectionClientState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>

  func connectionConsensusState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>

  func connectionParams(
    _ request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse>
}

extension Ibc_Core_Connection_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "ibc.core.connection.v1.Query"
  }

  /// Connection queries an IBC connection end.
  ///
  /// - Parameters:
  ///   - request: Request to send to Connection.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func connection(
    _ request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connection.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionInterceptors() ?? []
    )
  }

  /// Connections queries all the IBC connections of a chain.
  ///
  /// - Parameters:
  ///   - request: Request to send to Connections.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func connections(
    _ request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionsInterceptors() ?? []
    )
  }

  /// ClientConnections queries the connection paths associated with a client
  /// state.
  ///
  /// - Parameters:
  ///   - request: Request to send to ClientConnections.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func clientConnections(
    _ request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.clientConnections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientConnectionsInterceptors() ?? []
    )
  }

  /// ConnectionClientState queries the client state associated with the
  /// connection.
  ///
  /// - Parameters:
  ///   - request: Request to send to ConnectionClientState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func connectionClientState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionClientState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionClientStateInterceptors() ?? []
    )
  }

  /// ConnectionConsensusState queries the consensus state associated with the
  /// connection.
  ///
  /// - Parameters:
  ///   - request: Request to send to ConnectionConsensusState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func connectionConsensusState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionConsensusState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionConsensusStateInterceptors() ?? []
    )
  }

  /// ConnectionParams queries all parameters of the ibc connection submodule.
  ///
  /// - Parameters:
  ///   - request: Request to send to ConnectionParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func connectionParams(
    _ request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse> {
    return self.makeUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionParamsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Ibc_Core_Connection_V1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Ibc_Core_Connection_V1_QueryNIOClient")
internal final class Ibc_Core_Connection_V1_QueryClient: Ibc_Core_Connection_V1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the ibc.core.connection.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Ibc_Core_Connection_V1_QueryNIOClient: Ibc_Core_Connection_V1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the ibc.core.connection.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query provides defines the gRPC querier service
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Ibc_Core_Connection_V1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? { get }

  func makeConnectionCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse>

  func makeConnectionsCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse>

  func makeClientConnectionsCall(
    _ request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse>

  func makeConnectionClientStateCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>

  func makeConnectionConsensusStateCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>

  func makeConnectionParamsCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Ibc_Core_Connection_V1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Ibc_Core_Connection_V1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeConnectionCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connection.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionInterceptors() ?? []
    )
  }

  internal func makeConnectionsCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionsInterceptors() ?? []
    )
  }

  internal func makeClientConnectionsCall(
    _ request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.clientConnections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientConnectionsInterceptors() ?? []
    )
  }

  internal func makeConnectionClientStateCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionClientState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionClientStateInterceptors() ?? []
    )
  }

  internal func makeConnectionConsensusStateCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionConsensusState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionConsensusStateInterceptors() ?? []
    )
  }

  internal func makeConnectionParamsCall(
    _ request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Ibc_Core_Connection_V1_QueryAsyncClientProtocol {
  internal func connection(
    _ request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connection.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionInterceptors() ?? []
    )
  }

  internal func connections(
    _ request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionsResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionsInterceptors() ?? []
    )
  }

  internal func clientConnections(
    _ request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryClientConnectionsResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.clientConnections.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeClientConnectionsInterceptors() ?? []
    )
  }

  internal func connectionClientState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionClientStateResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionClientState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionClientStateInterceptors() ?? []
    )
  }

  internal func connectionConsensusState(
    _ request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionConsensusState.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionConsensusStateInterceptors() ?? []
    )
  }

  internal func connectionParams(
    _ request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionParams.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConnectionParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Ibc_Core_Connection_V1_QueryAsyncClient: Ibc_Core_Connection_V1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Ibc_Core_Connection_V1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'connection'.
  func makeConnectionInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse>]

  /// - Returns: Interceptors to use when invoking 'connections'.
  func makeConnectionsInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse>]

  /// - Returns: Interceptors to use when invoking 'clientConnections'.
  func makeClientConnectionsInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse>]

  /// - Returns: Interceptors to use when invoking 'connectionClientState'.
  func makeConnectionClientStateInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>]

  /// - Returns: Interceptors to use when invoking 'connectionConsensusState'.
  func makeConnectionConsensusStateInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>]

  /// - Returns: Interceptors to use when invoking 'connectionParams'.
  func makeConnectionParamsInterceptors() -> [ClientInterceptor<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse>]
}

internal enum Ibc_Core_Connection_V1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "ibc.core.connection.v1.Query",
    methods: [
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connection,
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connections,
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.clientConnections,
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionClientState,
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionConsensusState,
      Ibc_Core_Connection_V1_QueryClientMetadata.Methods.connectionParams,
    ]
  )

  internal enum Methods {
    internal static let connection = GRPCMethodDescriptor(
      name: "Connection",
      path: "/ibc.core.connection.v1.Query/Connection",
      type: GRPCCallType.unary
    )

    internal static let connections = GRPCMethodDescriptor(
      name: "Connections",
      path: "/ibc.core.connection.v1.Query/Connections",
      type: GRPCCallType.unary
    )

    internal static let clientConnections = GRPCMethodDescriptor(
      name: "ClientConnections",
      path: "/ibc.core.connection.v1.Query/ClientConnections",
      type: GRPCCallType.unary
    )

    internal static let connectionClientState = GRPCMethodDescriptor(
      name: "ConnectionClientState",
      path: "/ibc.core.connection.v1.Query/ConnectionClientState",
      type: GRPCCallType.unary
    )

    internal static let connectionConsensusState = GRPCMethodDescriptor(
      name: "ConnectionConsensusState",
      path: "/ibc.core.connection.v1.Query/ConnectionConsensusState",
      type: GRPCCallType.unary
    )

    internal static let connectionParams = GRPCMethodDescriptor(
      name: "ConnectionParams",
      path: "/ibc.core.connection.v1.Query/ConnectionParams",
      type: GRPCCallType.unary
    )
  }
}

/// Query provides defines the gRPC querier service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Ibc_Core_Connection_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Ibc_Core_Connection_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Connection queries an IBC connection end.
  func connection(request: Ibc_Core_Connection_V1_QueryConnectionRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryConnectionResponse>

  /// Connections queries all the IBC connections of a chain.
  func connections(request: Ibc_Core_Connection_V1_QueryConnectionsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryConnectionsResponse>

  /// ClientConnections queries the connection paths associated with a client
  /// state.
  func clientConnections(request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryClientConnectionsResponse>

  /// ConnectionClientState queries the client state associated with the
  /// connection.
  func connectionClientState(request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>

  /// ConnectionConsensusState queries the consensus state associated with the
  /// connection.
  func connectionConsensusState(request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>

  /// ConnectionParams queries all parameters of the ibc connection submodule.
  func connectionParams(request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Ibc_Core_Connection_V1_QueryConnectionParamsResponse>
}

extension Ibc_Core_Connection_V1_QueryProvider {
  internal var serviceName: Substring {
    return Ibc_Core_Connection_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Connection":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionResponse>(),
        interceptors: self.interceptors?.makeConnectionInterceptors() ?? [],
        userFunction: self.connection(request:context:)
      )

    case "Connections":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionsResponse>(),
        interceptors: self.interceptors?.makeConnectionsInterceptors() ?? [],
        userFunction: self.connections(request:context:)
      )

    case "ClientConnections":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryClientConnectionsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryClientConnectionsResponse>(),
        interceptors: self.interceptors?.makeClientConnectionsInterceptors() ?? [],
        userFunction: self.clientConnections(request:context:)
      )

    case "ConnectionClientState":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>(),
        interceptors: self.interceptors?.makeConnectionClientStateInterceptors() ?? [],
        userFunction: self.connectionClientState(request:context:)
      )

    case "ConnectionConsensusState":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>(),
        interceptors: self.interceptors?.makeConnectionConsensusStateInterceptors() ?? [],
        userFunction: self.connectionConsensusState(request:context:)
      )

    case "ConnectionParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionParamsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionParamsResponse>(),
        interceptors: self.interceptors?.makeConnectionParamsInterceptors() ?? [],
        userFunction: self.connectionParams(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query provides defines the gRPC querier service
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Ibc_Core_Connection_V1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Ibc_Core_Connection_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Connection queries an IBC connection end.
  @Sendable func connection(
    request: Ibc_Core_Connection_V1_QueryConnectionRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionResponse

  /// Connections queries all the IBC connections of a chain.
  @Sendable func connections(
    request: Ibc_Core_Connection_V1_QueryConnectionsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionsResponse

  /// ClientConnections queries the connection paths associated with a client
  /// state.
  @Sendable func clientConnections(
    request: Ibc_Core_Connection_V1_QueryClientConnectionsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryClientConnectionsResponse

  /// ConnectionClientState queries the client state associated with the
  /// connection.
  @Sendable func connectionClientState(
    request: Ibc_Core_Connection_V1_QueryConnectionClientStateRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionClientStateResponse

  /// ConnectionConsensusState queries the consensus state associated with the
  /// connection.
  @Sendable func connectionConsensusState(
    request: Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse

  /// ConnectionParams queries all parameters of the ibc connection submodule.
  @Sendable func connectionParams(
    request: Ibc_Core_Connection_V1_QueryConnectionParamsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Ibc_Core_Connection_V1_QueryConnectionParamsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Ibc_Core_Connection_V1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Ibc_Core_Connection_V1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Ibc_Core_Connection_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Ibc_Core_Connection_V1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Connection":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionResponse>(),
        interceptors: self.interceptors?.makeConnectionInterceptors() ?? [],
        wrapping: self.connection(request:context:)
      )

    case "Connections":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionsResponse>(),
        interceptors: self.interceptors?.makeConnectionsInterceptors() ?? [],
        wrapping: self.connections(request:context:)
      )

    case "ClientConnections":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryClientConnectionsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryClientConnectionsResponse>(),
        interceptors: self.interceptors?.makeClientConnectionsInterceptors() ?? [],
        wrapping: self.clientConnections(request:context:)
      )

    case "ConnectionClientState":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>(),
        interceptors: self.interceptors?.makeConnectionClientStateInterceptors() ?? [],
        wrapping: self.connectionClientState(request:context:)
      )

    case "ConnectionConsensusState":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>(),
        interceptors: self.interceptors?.makeConnectionConsensusStateInterceptors() ?? [],
        wrapping: self.connectionConsensusState(request:context:)
      )

    case "ConnectionParams":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Ibc_Core_Connection_V1_QueryConnectionParamsRequest>(),
        responseSerializer: ProtobufSerializer<Ibc_Core_Connection_V1_QueryConnectionParamsResponse>(),
        interceptors: self.interceptors?.makeConnectionParamsInterceptors() ?? [],
        wrapping: self.connectionParams(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Ibc_Core_Connection_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'connection'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConnectionInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryConnectionRequest, Ibc_Core_Connection_V1_QueryConnectionResponse>]

  /// - Returns: Interceptors to use when handling 'connections'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConnectionsInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryConnectionsRequest, Ibc_Core_Connection_V1_QueryConnectionsResponse>]

  /// - Returns: Interceptors to use when handling 'clientConnections'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeClientConnectionsInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryClientConnectionsRequest, Ibc_Core_Connection_V1_QueryClientConnectionsResponse>]

  /// - Returns: Interceptors to use when handling 'connectionClientState'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConnectionClientStateInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryConnectionClientStateRequest, Ibc_Core_Connection_V1_QueryConnectionClientStateResponse>]

  /// - Returns: Interceptors to use when handling 'connectionConsensusState'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConnectionConsensusStateInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryConnectionConsensusStateRequest, Ibc_Core_Connection_V1_QueryConnectionConsensusStateResponse>]

  /// - Returns: Interceptors to use when handling 'connectionParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConnectionParamsInterceptors() -> [ServerInterceptor<Ibc_Core_Connection_V1_QueryConnectionParamsRequest, Ibc_Core_Connection_V1_QueryConnectionParamsResponse>]
}

internal enum Ibc_Core_Connection_V1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "ibc.core.connection.v1.Query",
    methods: [
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.connection,
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.connections,
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.clientConnections,
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.connectionClientState,
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.connectionConsensusState,
      Ibc_Core_Connection_V1_QueryServerMetadata.Methods.connectionParams,
    ]
  )

  internal enum Methods {
    internal static let connection = GRPCMethodDescriptor(
      name: "Connection",
      path: "/ibc.core.connection.v1.Query/Connection",
      type: GRPCCallType.unary
    )

    internal static let connections = GRPCMethodDescriptor(
      name: "Connections",
      path: "/ibc.core.connection.v1.Query/Connections",
      type: GRPCCallType.unary
    )

    internal static let clientConnections = GRPCMethodDescriptor(
      name: "ClientConnections",
      path: "/ibc.core.connection.v1.Query/ClientConnections",
      type: GRPCCallType.unary
    )

    internal static let connectionClientState = GRPCMethodDescriptor(
      name: "ConnectionClientState",
      path: "/ibc.core.connection.v1.Query/ConnectionClientState",
      type: GRPCCallType.unary
    )

    internal static let connectionConsensusState = GRPCMethodDescriptor(
      name: "ConnectionConsensusState",
      path: "/ibc.core.connection.v1.Query/ConnectionConsensusState",
      type: GRPCCallType.unary
    )

    internal static let connectionParams = GRPCMethodDescriptor(
      name: "ConnectionParams",
      path: "/ibc.core.connection.v1.Query/ConnectionParams",
      type: GRPCCallType.unary
    )
  }
}
