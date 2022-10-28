//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/router/v1beta1/tx.proto
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


/// Msg defines the router Msg service.
///
/// Usage: instantiate `Kava_Router_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Router_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Router_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func mintDeposit(
    _ request: Kava_Router_V1beta1_MsgMintDeposit,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Router_V1beta1_MsgMintDeposit, Kava_Router_V1beta1_MsgMintDepositResponse>

  func delegateMintDeposit(
    _ request: Kava_Router_V1beta1_MsgDelegateMintDeposit,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Router_V1beta1_MsgDelegateMintDeposit, Kava_Router_V1beta1_MsgDelegateMintDepositResponse>

  func withdrawBurn(
    _ request: Kava_Router_V1beta1_MsgWithdrawBurn,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Router_V1beta1_MsgWithdrawBurn, Kava_Router_V1beta1_MsgWithdrawBurnResponse>

  func withdrawBurnUndelegate(
    _ request: Kava_Router_V1beta1_MsgWithdrawBurnUndelegate,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Router_V1beta1_MsgWithdrawBurnUndelegate, Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse>
}

extension Kava_Router_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "kava.router.v1beta1.Msg"
  }

  /// MintDeposit converts a delegation into staking derivatives and deposits it all into an earn vault.
  ///
  /// - Parameters:
  ///   - request: Request to send to MintDeposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func mintDeposit(
    _ request: Kava_Router_V1beta1_MsgMintDeposit,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Router_V1beta1_MsgMintDeposit, Kava_Router_V1beta1_MsgMintDepositResponse> {
    return self.makeUnaryCall(
      path: "/kava.router.v1beta1.Msg/MintDeposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMintDepositInterceptors() ?? []
    )
  }

  /// DelegateMintDeposit delegates tokens to a validator, then converts them into staking derivatives,
  /// then deposits to an earn vault.
  ///
  /// - Parameters:
  ///   - request: Request to send to DelegateMintDeposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegateMintDeposit(
    _ request: Kava_Router_V1beta1_MsgDelegateMintDeposit,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Router_V1beta1_MsgDelegateMintDeposit, Kava_Router_V1beta1_MsgDelegateMintDepositResponse> {
    return self.makeUnaryCall(
      path: "/kava.router.v1beta1.Msg/DelegateMintDeposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDelegateMintDepositInterceptors() ?? []
    )
  }

  /// WithdrawBurn removes staking derivatives from an earn vault and converts them back to a staking delegation.
  ///
  /// - Parameters:
  ///   - request: Request to send to WithdrawBurn.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdrawBurn(
    _ request: Kava_Router_V1beta1_MsgWithdrawBurn,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Router_V1beta1_MsgWithdrawBurn, Kava_Router_V1beta1_MsgWithdrawBurnResponse> {
    return self.makeUnaryCall(
      path: "/kava.router.v1beta1.Msg/WithdrawBurn",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWithdrawBurnInterceptors() ?? []
    )
  }

  /// WithdrawBurnUndelegate removes staking derivatives from an earn vault, converts them to a staking delegation,
  /// then undelegates them from their validator.
  ///
  /// - Parameters:
  ///   - request: Request to send to WithdrawBurnUndelegate.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdrawBurnUndelegate(
    _ request: Kava_Router_V1beta1_MsgWithdrawBurnUndelegate,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Router_V1beta1_MsgWithdrawBurnUndelegate, Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse> {
    return self.makeUnaryCall(
      path: "/kava.router.v1beta1.Msg/WithdrawBurnUndelegate",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWithdrawBurnUndelegateInterceptors() ?? []
    )
  }
}

internal protocol Kava_Router_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'mintDeposit'.
  func makeMintDepositInterceptors() -> [ClientInterceptor<Kava_Router_V1beta1_MsgMintDeposit, Kava_Router_V1beta1_MsgMintDepositResponse>]

  /// - Returns: Interceptors to use when invoking 'delegateMintDeposit'.
  func makeDelegateMintDepositInterceptors() -> [ClientInterceptor<Kava_Router_V1beta1_MsgDelegateMintDeposit, Kava_Router_V1beta1_MsgDelegateMintDepositResponse>]

  /// - Returns: Interceptors to use when invoking 'withdrawBurn'.
  func makeWithdrawBurnInterceptors() -> [ClientInterceptor<Kava_Router_V1beta1_MsgWithdrawBurn, Kava_Router_V1beta1_MsgWithdrawBurnResponse>]

  /// - Returns: Interceptors to use when invoking 'withdrawBurnUndelegate'.
  func makeWithdrawBurnUndelegateInterceptors() -> [ClientInterceptor<Kava_Router_V1beta1_MsgWithdrawBurnUndelegate, Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse>]
}

internal final class Kava_Router_V1beta1_MsgClient: Kava_Router_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Router_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.router.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Router_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the router Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Router_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Kava_Router_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// MintDeposit converts a delegation into staking derivatives and deposits it all into an earn vault.
  func mintDeposit(request: Kava_Router_V1beta1_MsgMintDeposit, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Router_V1beta1_MsgMintDepositResponse>

  /// DelegateMintDeposit delegates tokens to a validator, then converts them into staking derivatives,
  /// then deposits to an earn vault.
  func delegateMintDeposit(request: Kava_Router_V1beta1_MsgDelegateMintDeposit, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Router_V1beta1_MsgDelegateMintDepositResponse>

  /// WithdrawBurn removes staking derivatives from an earn vault and converts them back to a staking delegation.
  func withdrawBurn(request: Kava_Router_V1beta1_MsgWithdrawBurn, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Router_V1beta1_MsgWithdrawBurnResponse>

  /// WithdrawBurnUndelegate removes staking derivatives from an earn vault, converts them to a staking delegation,
  /// then undelegates them from their validator.
  func withdrawBurnUndelegate(request: Kava_Router_V1beta1_MsgWithdrawBurnUndelegate, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse>
}

extension Kava_Router_V1beta1_MsgProvider {
  internal var serviceName: Substring { return "kava.router.v1beta1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "MintDeposit":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Router_V1beta1_MsgMintDeposit>(),
        responseSerializer: ProtobufSerializer<Kava_Router_V1beta1_MsgMintDepositResponse>(),
        interceptors: self.interceptors?.makeMintDepositInterceptors() ?? [],
        userFunction: self.mintDeposit(request:context:)
      )

    case "DelegateMintDeposit":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Router_V1beta1_MsgDelegateMintDeposit>(),
        responseSerializer: ProtobufSerializer<Kava_Router_V1beta1_MsgDelegateMintDepositResponse>(),
        interceptors: self.interceptors?.makeDelegateMintDepositInterceptors() ?? [],
        userFunction: self.delegateMintDeposit(request:context:)
      )

    case "WithdrawBurn":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Router_V1beta1_MsgWithdrawBurn>(),
        responseSerializer: ProtobufSerializer<Kava_Router_V1beta1_MsgWithdrawBurnResponse>(),
        interceptors: self.interceptors?.makeWithdrawBurnInterceptors() ?? [],
        userFunction: self.withdrawBurn(request:context:)
      )

    case "WithdrawBurnUndelegate":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Router_V1beta1_MsgWithdrawBurnUndelegate>(),
        responseSerializer: ProtobufSerializer<Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse>(),
        interceptors: self.interceptors?.makeWithdrawBurnUndelegateInterceptors() ?? [],
        userFunction: self.withdrawBurnUndelegate(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Router_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'mintDeposit'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeMintDepositInterceptors() -> [ServerInterceptor<Kava_Router_V1beta1_MsgMintDeposit, Kava_Router_V1beta1_MsgMintDepositResponse>]

  /// - Returns: Interceptors to use when handling 'delegateMintDeposit'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDelegateMintDepositInterceptors() -> [ServerInterceptor<Kava_Router_V1beta1_MsgDelegateMintDeposit, Kava_Router_V1beta1_MsgDelegateMintDepositResponse>]

  /// - Returns: Interceptors to use when handling 'withdrawBurn'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeWithdrawBurnInterceptors() -> [ServerInterceptor<Kava_Router_V1beta1_MsgWithdrawBurn, Kava_Router_V1beta1_MsgWithdrawBurnResponse>]

  /// - Returns: Interceptors to use when handling 'withdrawBurnUndelegate'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeWithdrawBurnUndelegateInterceptors() -> [ServerInterceptor<Kava_Router_V1beta1_MsgWithdrawBurnUndelegate, Kava_Router_V1beta1_MsgWithdrawBurnUndelegateResponse>]
}
