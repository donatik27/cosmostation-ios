//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/swap/v1beta1/tx.proto
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


/// Msg defines the swap Msg service.
///
/// Usage: instantiate `Kava_Swap_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Swap_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Swap_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func deposit(
    _ request: Kava_Swap_V1beta1_MsgDeposit,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgDeposit, Kava_Swap_V1beta1_MsgDepositResponse>

  func withdraw(
    _ request: Kava_Swap_V1beta1_MsgWithdraw,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgWithdraw, Kava_Swap_V1beta1_MsgWithdrawResponse>

  func swapExactForTokens(
    _ request: Kava_Swap_V1beta1_MsgSwapExactForTokens,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgSwapExactForTokens, Kava_Swap_V1beta1_MsgSwapExactForTokensResponse>

  func swapForExactTokens(
    _ request: Kava_Swap_V1beta1_MsgSwapForExactTokens,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgSwapForExactTokens, Kava_Swap_V1beta1_MsgSwapForExactTokensResponse>
}

extension Kava_Swap_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "kava.swap.v1beta1.Msg"
  }

  /// Deposit defines a method for depositing liquidity into a pool
  ///
  /// - Parameters:
  ///   - request: Request to send to Deposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deposit(
    _ request: Kava_Swap_V1beta1_MsgDeposit,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgDeposit, Kava_Swap_V1beta1_MsgDepositResponse> {
    return self.makeUnaryCall(
      path: "/kava.swap.v1beta1.Msg/Deposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositInterceptors() ?? []
    )
  }

  /// Withdraw defines a method for withdrawing liquidity into a pool
  ///
  /// - Parameters:
  ///   - request: Request to send to Withdraw.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdraw(
    _ request: Kava_Swap_V1beta1_MsgWithdraw,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgWithdraw, Kava_Swap_V1beta1_MsgWithdrawResponse> {
    return self.makeUnaryCall(
      path: "/kava.swap.v1beta1.Msg/Withdraw",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWithdrawInterceptors() ?? []
    )
  }

  /// SwapExactForTokens represents a message for trading exact coinA for coinB
  ///
  /// - Parameters:
  ///   - request: Request to send to SwapExactForTokens.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func swapExactForTokens(
    _ request: Kava_Swap_V1beta1_MsgSwapExactForTokens,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgSwapExactForTokens, Kava_Swap_V1beta1_MsgSwapExactForTokensResponse> {
    return self.makeUnaryCall(
      path: "/kava.swap.v1beta1.Msg/SwapExactForTokens",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSwapExactForTokensInterceptors() ?? []
    )
  }

  /// SwapForExactTokens represents a message for trading coinA for an exact coinB
  ///
  /// - Parameters:
  ///   - request: Request to send to SwapForExactTokens.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func swapForExactTokens(
    _ request: Kava_Swap_V1beta1_MsgSwapForExactTokens,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Swap_V1beta1_MsgSwapForExactTokens, Kava_Swap_V1beta1_MsgSwapForExactTokensResponse> {
    return self.makeUnaryCall(
      path: "/kava.swap.v1beta1.Msg/SwapForExactTokens",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSwapForExactTokensInterceptors() ?? []
    )
  }
}

internal protocol Kava_Swap_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'deposit'.
  func makeDepositInterceptors() -> [ClientInterceptor<Kava_Swap_V1beta1_MsgDeposit, Kava_Swap_V1beta1_MsgDepositResponse>]

  /// - Returns: Interceptors to use when invoking 'withdraw'.
  func makeWithdrawInterceptors() -> [ClientInterceptor<Kava_Swap_V1beta1_MsgWithdraw, Kava_Swap_V1beta1_MsgWithdrawResponse>]

  /// - Returns: Interceptors to use when invoking 'swapExactForTokens'.
  func makeSwapExactForTokensInterceptors() -> [ClientInterceptor<Kava_Swap_V1beta1_MsgSwapExactForTokens, Kava_Swap_V1beta1_MsgSwapExactForTokensResponse>]

  /// - Returns: Interceptors to use when invoking 'swapForExactTokens'.
  func makeSwapForExactTokensInterceptors() -> [ClientInterceptor<Kava_Swap_V1beta1_MsgSwapForExactTokens, Kava_Swap_V1beta1_MsgSwapForExactTokensResponse>]
}

internal final class Kava_Swap_V1beta1_MsgClient: Kava_Swap_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Swap_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.swap.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Swap_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the swap Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Swap_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Kava_Swap_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// Deposit defines a method for depositing liquidity into a pool
  func deposit(request: Kava_Swap_V1beta1_MsgDeposit, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Swap_V1beta1_MsgDepositResponse>

  /// Withdraw defines a method for withdrawing liquidity into a pool
  func withdraw(request: Kava_Swap_V1beta1_MsgWithdraw, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Swap_V1beta1_MsgWithdrawResponse>

  /// SwapExactForTokens represents a message for trading exact coinA for coinB
  func swapExactForTokens(request: Kava_Swap_V1beta1_MsgSwapExactForTokens, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Swap_V1beta1_MsgSwapExactForTokensResponse>

  /// SwapForExactTokens represents a message for trading coinA for an exact coinB
  func swapForExactTokens(request: Kava_Swap_V1beta1_MsgSwapForExactTokens, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Swap_V1beta1_MsgSwapForExactTokensResponse>
}

extension Kava_Swap_V1beta1_MsgProvider {
  internal var serviceName: Substring { return "kava.swap.v1beta1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Deposit":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Swap_V1beta1_MsgDeposit>(),
        responseSerializer: ProtobufSerializer<Kava_Swap_V1beta1_MsgDepositResponse>(),
        interceptors: self.interceptors?.makeDepositInterceptors() ?? [],
        userFunction: self.deposit(request:context:)
      )

    case "Withdraw":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Swap_V1beta1_MsgWithdraw>(),
        responseSerializer: ProtobufSerializer<Kava_Swap_V1beta1_MsgWithdrawResponse>(),
        interceptors: self.interceptors?.makeWithdrawInterceptors() ?? [],
        userFunction: self.withdraw(request:context:)
      )

    case "SwapExactForTokens":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Swap_V1beta1_MsgSwapExactForTokens>(),
        responseSerializer: ProtobufSerializer<Kava_Swap_V1beta1_MsgSwapExactForTokensResponse>(),
        interceptors: self.interceptors?.makeSwapExactForTokensInterceptors() ?? [],
        userFunction: self.swapExactForTokens(request:context:)
      )

    case "SwapForExactTokens":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Swap_V1beta1_MsgSwapForExactTokens>(),
        responseSerializer: ProtobufSerializer<Kava_Swap_V1beta1_MsgSwapForExactTokensResponse>(),
        interceptors: self.interceptors?.makeSwapForExactTokensInterceptors() ?? [],
        userFunction: self.swapForExactTokens(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Swap_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'deposit'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDepositInterceptors() -> [ServerInterceptor<Kava_Swap_V1beta1_MsgDeposit, Kava_Swap_V1beta1_MsgDepositResponse>]

  /// - Returns: Interceptors to use when handling 'withdraw'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeWithdrawInterceptors() -> [ServerInterceptor<Kava_Swap_V1beta1_MsgWithdraw, Kava_Swap_V1beta1_MsgWithdrawResponse>]

  /// - Returns: Interceptors to use when handling 'swapExactForTokens'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSwapExactForTokensInterceptors() -> [ServerInterceptor<Kava_Swap_V1beta1_MsgSwapExactForTokens, Kava_Swap_V1beta1_MsgSwapExactForTokensResponse>]

  /// - Returns: Interceptors to use when handling 'swapForExactTokens'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSwapForExactTokensInterceptors() -> [ServerInterceptor<Kava_Swap_V1beta1_MsgSwapForExactTokens, Kava_Swap_V1beta1_MsgSwapForExactTokensResponse>]
}
