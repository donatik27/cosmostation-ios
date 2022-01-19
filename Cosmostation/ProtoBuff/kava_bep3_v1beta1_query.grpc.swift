//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/bep3/v1beta1/query.proto
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
import SwiftProtobuf


/// Query defines the gRPC querier service for bep3 module
///
/// Usage: instantiate `Kava_Bep3_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Bep3_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Bep3_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Kava_Bep3_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryParamsRequest, Kava_Bep3_V1beta1_QueryParamsResponse>

  func assetSupply(
    _ request: Kava_Bep3_V1beta1_QueryAssetSupplyRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAssetSupplyRequest, Kava_Bep3_V1beta1_QueryAssetSupplyResponse>

  func assetSupplies(
    _ request: Kava_Bep3_V1beta1_QueryAssetSuppliesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, Kava_Bep3_V1beta1_QueryAssetSuppliesResponse>

  func atomicSwap(
    _ request: Kava_Bep3_V1beta1_QueryAtomicSwapRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAtomicSwapRequest, Kava_Bep3_V1beta1_QueryAtomicSwapResponse>

  func atomicSwaps(
    _ request: Kava_Bep3_V1beta1_QueryAtomicSwapsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, Kava_Bep3_V1beta1_QueryAtomicSwapsResponse>
}

extension Kava_Bep3_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "kava.bep3.v1beta1.Query"
  }

  /// Params queries module params
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Kava_Bep3_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryParamsRequest, Kava_Bep3_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/kava.bep3.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// AssetSupply queries info about an asset's supply
  ///
  /// - Parameters:
  ///   - request: Request to send to AssetSupply.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func assetSupply(
    _ request: Kava_Bep3_V1beta1_QueryAssetSupplyRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAssetSupplyRequest, Kava_Bep3_V1beta1_QueryAssetSupplyResponse> {
    return self.makeUnaryCall(
      path: "/kava.bep3.v1beta1.Query/AssetSupply",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAssetSupplyInterceptors() ?? []
    )
  }

  /// AssetSupplies queries a list of asset supplies
  ///
  /// - Parameters:
  ///   - request: Request to send to AssetSupplies.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func assetSupplies(
    _ request: Kava_Bep3_V1beta1_QueryAssetSuppliesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, Kava_Bep3_V1beta1_QueryAssetSuppliesResponse> {
    return self.makeUnaryCall(
      path: "/kava.bep3.v1beta1.Query/AssetSupplies",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAssetSuppliesInterceptors() ?? []
    )
  }

  /// AtomicSwap queries info about an atomic swap
  ///
  /// - Parameters:
  ///   - request: Request to send to AtomicSwap.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func atomicSwap(
    _ request: Kava_Bep3_V1beta1_QueryAtomicSwapRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAtomicSwapRequest, Kava_Bep3_V1beta1_QueryAtomicSwapResponse> {
    return self.makeUnaryCall(
      path: "/kava.bep3.v1beta1.Query/AtomicSwap",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAtomicSwapInterceptors() ?? []
    )
  }

  /// AtomicSwaps queries a list of atomic swaps
  ///
  /// - Parameters:
  ///   - request: Request to send to AtomicSwaps.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func atomicSwaps(
    _ request: Kava_Bep3_V1beta1_QueryAtomicSwapsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, Kava_Bep3_V1beta1_QueryAtomicSwapsResponse> {
    return self.makeUnaryCall(
      path: "/kava.bep3.v1beta1.Query/AtomicSwaps",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAtomicSwapsInterceptors() ?? []
    )
  }
}

internal protocol Kava_Bep3_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Kava_Bep3_V1beta1_QueryParamsRequest, Kava_Bep3_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'assetSupply'.
  func makeAssetSupplyInterceptors() -> [ClientInterceptor<Kava_Bep3_V1beta1_QueryAssetSupplyRequest, Kava_Bep3_V1beta1_QueryAssetSupplyResponse>]

  /// - Returns: Interceptors to use when invoking 'assetSupplies'.
  func makeAssetSuppliesInterceptors() -> [ClientInterceptor<Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, Kava_Bep3_V1beta1_QueryAssetSuppliesResponse>]

  /// - Returns: Interceptors to use when invoking 'atomicSwap'.
  func makeAtomicSwapInterceptors() -> [ClientInterceptor<Kava_Bep3_V1beta1_QueryAtomicSwapRequest, Kava_Bep3_V1beta1_QueryAtomicSwapResponse>]

  /// - Returns: Interceptors to use when invoking 'atomicSwaps'.
  func makeAtomicSwapsInterceptors() -> [ClientInterceptor<Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, Kava_Bep3_V1beta1_QueryAtomicSwapsResponse>]
}

internal final class Kava_Bep3_V1beta1_QueryClient: Kava_Bep3_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Bep3_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.bep3.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Bep3_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service for bep3 module
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Bep3_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Kava_Bep3_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params queries module params
  func params(request: Kava_Bep3_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Bep3_V1beta1_QueryParamsResponse>

  /// AssetSupply queries info about an asset's supply
  func assetSupply(request: Kava_Bep3_V1beta1_QueryAssetSupplyRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Bep3_V1beta1_QueryAssetSupplyResponse>

  /// AssetSupplies queries a list of asset supplies
  func assetSupplies(request: Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Bep3_V1beta1_QueryAssetSuppliesResponse>

  /// AtomicSwap queries info about an atomic swap
  func atomicSwap(request: Kava_Bep3_V1beta1_QueryAtomicSwapRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Bep3_V1beta1_QueryAtomicSwapResponse>

  /// AtomicSwaps queries a list of atomic swaps
  func atomicSwaps(request: Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Bep3_V1beta1_QueryAtomicSwapsResponse>
}

extension Kava_Bep3_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "kava.bep3.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Bep3_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Bep3_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "AssetSupply":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Bep3_V1beta1_QueryAssetSupplyRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Bep3_V1beta1_QueryAssetSupplyResponse>(),
        interceptors: self.interceptors?.makeAssetSupplyInterceptors() ?? [],
        userFunction: self.assetSupply(request:context:)
      )

    case "AssetSupplies":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Bep3_V1beta1_QueryAssetSuppliesRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Bep3_V1beta1_QueryAssetSuppliesResponse>(),
        interceptors: self.interceptors?.makeAssetSuppliesInterceptors() ?? [],
        userFunction: self.assetSupplies(request:context:)
      )

    case "AtomicSwap":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Bep3_V1beta1_QueryAtomicSwapRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Bep3_V1beta1_QueryAtomicSwapResponse>(),
        interceptors: self.interceptors?.makeAtomicSwapInterceptors() ?? [],
        userFunction: self.atomicSwap(request:context:)
      )

    case "AtomicSwaps":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Bep3_V1beta1_QueryAtomicSwapsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Bep3_V1beta1_QueryAtomicSwapsResponse>(),
        interceptors: self.interceptors?.makeAtomicSwapsInterceptors() ?? [],
        userFunction: self.atomicSwaps(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Bep3_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Kava_Bep3_V1beta1_QueryParamsRequest, Kava_Bep3_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'assetSupply'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAssetSupplyInterceptors() -> [ServerInterceptor<Kava_Bep3_V1beta1_QueryAssetSupplyRequest, Kava_Bep3_V1beta1_QueryAssetSupplyResponse>]

  /// - Returns: Interceptors to use when handling 'assetSupplies'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAssetSuppliesInterceptors() -> [ServerInterceptor<Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, Kava_Bep3_V1beta1_QueryAssetSuppliesResponse>]

  /// - Returns: Interceptors to use when handling 'atomicSwap'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAtomicSwapInterceptors() -> [ServerInterceptor<Kava_Bep3_V1beta1_QueryAtomicSwapRequest, Kava_Bep3_V1beta1_QueryAtomicSwapResponse>]

  /// - Returns: Interceptors to use when handling 'atomicSwaps'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAtomicSwapsInterceptors() -> [ServerInterceptor<Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, Kava_Bep3_V1beta1_QueryAtomicSwapsResponse>]
}
