//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/liquid/v1beta1/tx.proto
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


/// Msg defines the liquid Msg service.
///
/// Usage: instantiate `Kava_Liquid_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Liquid_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Liquid_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func mintDerivative(
    _ request: Kava_Liquid_V1beta1_MsgMintDerivative,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Liquid_V1beta1_MsgMintDerivative, Kava_Liquid_V1beta1_MsgMintDerivativeResponse>

  func burnDerivative(
    _ request: Kava_Liquid_V1beta1_MsgBurnDerivative,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Liquid_V1beta1_MsgBurnDerivative, Kava_Liquid_V1beta1_MsgBurnDerivativeResponse>
}

extension Kava_Liquid_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "kava.liquid.v1beta1.Msg"
  }

  /// MintDerivative defines a method for converting a delegation into staking deriviatives.
  ///
  /// - Parameters:
  ///   - request: Request to send to MintDerivative.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func mintDerivative(
    _ request: Kava_Liquid_V1beta1_MsgMintDerivative,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Liquid_V1beta1_MsgMintDerivative, Kava_Liquid_V1beta1_MsgMintDerivativeResponse> {
    return self.makeUnaryCall(
      path: "/kava.liquid.v1beta1.Msg/MintDerivative",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMintDerivativeInterceptors() ?? []
    )
  }

  /// BurnDerivative defines a method for converting staking deriviatives into a delegation.
  ///
  /// - Parameters:
  ///   - request: Request to send to BurnDerivative.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func burnDerivative(
    _ request: Kava_Liquid_V1beta1_MsgBurnDerivative,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Liquid_V1beta1_MsgBurnDerivative, Kava_Liquid_V1beta1_MsgBurnDerivativeResponse> {
    return self.makeUnaryCall(
      path: "/kava.liquid.v1beta1.Msg/BurnDerivative",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBurnDerivativeInterceptors() ?? []
    )
  }
}

internal protocol Kava_Liquid_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'mintDerivative'.
  func makeMintDerivativeInterceptors() -> [ClientInterceptor<Kava_Liquid_V1beta1_MsgMintDerivative, Kava_Liquid_V1beta1_MsgMintDerivativeResponse>]

  /// - Returns: Interceptors to use when invoking 'burnDerivative'.
  func makeBurnDerivativeInterceptors() -> [ClientInterceptor<Kava_Liquid_V1beta1_MsgBurnDerivative, Kava_Liquid_V1beta1_MsgBurnDerivativeResponse>]
}

internal final class Kava_Liquid_V1beta1_MsgClient: Kava_Liquid_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Liquid_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.liquid.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Liquid_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the liquid Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Liquid_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Kava_Liquid_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// MintDerivative defines a method for converting a delegation into staking deriviatives.
  func mintDerivative(request: Kava_Liquid_V1beta1_MsgMintDerivative, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Liquid_V1beta1_MsgMintDerivativeResponse>

  /// BurnDerivative defines a method for converting staking deriviatives into a delegation.
  func burnDerivative(request: Kava_Liquid_V1beta1_MsgBurnDerivative, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Liquid_V1beta1_MsgBurnDerivativeResponse>
}

extension Kava_Liquid_V1beta1_MsgProvider {
  internal var serviceName: Substring { return "kava.liquid.v1beta1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "MintDerivative":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Liquid_V1beta1_MsgMintDerivative>(),
        responseSerializer: ProtobufSerializer<Kava_Liquid_V1beta1_MsgMintDerivativeResponse>(),
        interceptors: self.interceptors?.makeMintDerivativeInterceptors() ?? [],
        userFunction: self.mintDerivative(request:context:)
      )

    case "BurnDerivative":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Liquid_V1beta1_MsgBurnDerivative>(),
        responseSerializer: ProtobufSerializer<Kava_Liquid_V1beta1_MsgBurnDerivativeResponse>(),
        interceptors: self.interceptors?.makeBurnDerivativeInterceptors() ?? [],
        userFunction: self.burnDerivative(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Liquid_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'mintDerivative'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeMintDerivativeInterceptors() -> [ServerInterceptor<Kava_Liquid_V1beta1_MsgMintDerivative, Kava_Liquid_V1beta1_MsgMintDerivativeResponse>]

  /// - Returns: Interceptors to use when handling 'burnDerivative'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeBurnDerivativeInterceptors() -> [ServerInterceptor<Kava_Liquid_V1beta1_MsgBurnDerivative, Kava_Liquid_V1beta1_MsgBurnDerivativeResponse>]
}
