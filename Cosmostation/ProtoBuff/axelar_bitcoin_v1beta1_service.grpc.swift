//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: axelar/bitcoin/v1beta1/service.proto
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


/// Msg defines the bitcoin Msg service.
///
/// Usage: instantiate `Axelar_Bitcoin_V1beta1_MsgServiceClient`, then call methods of this protocol to make API calls.
internal protocol Axelar_Bitcoin_V1beta1_MsgServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Axelar_Bitcoin_V1beta1_MsgServiceClientInterceptorFactoryProtocol? { get }

  func link(
    _ request: Axelar_Bitcoin_V1beta1_LinkRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_LinkRequest, Axelar_Bitcoin_V1beta1_LinkResponse>

  func confirmOutpoint(
    _ request: Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse>

  func voteConfirmOutpoint(
    _ request: Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse>

  func createPendingTransfersTx(
    _ request: Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest, Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse>

  func createMasterTx(
    _ request: Axelar_Bitcoin_V1beta1_CreateMasterTxRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreateMasterTxRequest, Axelar_Bitcoin_V1beta1_CreateMasterTxResponse>

  func createRescueTx(
    _ request: Axelar_Bitcoin_V1beta1_CreateRescueTxRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreateRescueTxRequest, Axelar_Bitcoin_V1beta1_CreateRescueTxResponse>

  func signTx(
    _ request: Axelar_Bitcoin_V1beta1_SignTxRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_SignTxRequest, Axelar_Bitcoin_V1beta1_SignTxResponse>

  func submitExternalSignature(
    _ request: Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest, Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse>
}

extension Axelar_Bitcoin_V1beta1_MsgServiceClientProtocol {
  internal var serviceName: String {
    return "axelar.bitcoin.v1beta1.MsgService"
  }

  /// Unary call to Link
  ///
  /// - Parameters:
  ///   - request: Request to send to Link.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func link(
    _ request: Axelar_Bitcoin_V1beta1_LinkRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_LinkRequest, Axelar_Bitcoin_V1beta1_LinkResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/Link",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLinkInterceptors() ?? []
    )
  }

  /// Unary call to ConfirmOutpoint
  ///
  /// - Parameters:
  ///   - request: Request to send to ConfirmOutpoint.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func confirmOutpoint(
    _ request: Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/ConfirmOutpoint",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfirmOutpointInterceptors() ?? []
    )
  }

  /// Unary call to VoteConfirmOutpoint
  ///
  /// - Parameters:
  ///   - request: Request to send to VoteConfirmOutpoint.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func voteConfirmOutpoint(
    _ request: Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/VoteConfirmOutpoint",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeVoteConfirmOutpointInterceptors() ?? []
    )
  }

  /// Unary call to CreatePendingTransfersTx
  ///
  /// - Parameters:
  ///   - request: Request to send to CreatePendingTransfersTx.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createPendingTransfersTx(
    _ request: Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest, Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/CreatePendingTransfersTx",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreatePendingTransfersTxInterceptors() ?? []
    )
  }

  /// Unary call to CreateMasterTx
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateMasterTx.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createMasterTx(
    _ request: Axelar_Bitcoin_V1beta1_CreateMasterTxRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreateMasterTxRequest, Axelar_Bitcoin_V1beta1_CreateMasterTxResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/CreateMasterTx",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateMasterTxInterceptors() ?? []
    )
  }

  /// Unary call to CreateRescueTx
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateRescueTx.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createRescueTx(
    _ request: Axelar_Bitcoin_V1beta1_CreateRescueTxRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_CreateRescueTxRequest, Axelar_Bitcoin_V1beta1_CreateRescueTxResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/CreateRescueTx",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateRescueTxInterceptors() ?? []
    )
  }

  /// Unary call to SignTx
  ///
  /// - Parameters:
  ///   - request: Request to send to SignTx.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func signTx(
    _ request: Axelar_Bitcoin_V1beta1_SignTxRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_SignTxRequest, Axelar_Bitcoin_V1beta1_SignTxResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/SignTx",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSignTxInterceptors() ?? []
    )
  }

  /// Unary call to SubmitExternalSignature
  ///
  /// - Parameters:
  ///   - request: Request to send to SubmitExternalSignature.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func submitExternalSignature(
    _ request: Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest, Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse> {
    return self.makeUnaryCall(
      path: "/axelar.bitcoin.v1beta1.MsgService/SubmitExternalSignature",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSubmitExternalSignatureInterceptors() ?? []
    )
  }
}

internal protocol Axelar_Bitcoin_V1beta1_MsgServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'link'.
  func makeLinkInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_LinkRequest, Axelar_Bitcoin_V1beta1_LinkResponse>]

  /// - Returns: Interceptors to use when invoking 'confirmOutpoint'.
  func makeConfirmOutpointInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse>]

  /// - Returns: Interceptors to use when invoking 'voteConfirmOutpoint'.
  func makeVoteConfirmOutpointInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse>]

  /// - Returns: Interceptors to use when invoking 'createPendingTransfersTx'.
  func makeCreatePendingTransfersTxInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest, Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse>]

  /// - Returns: Interceptors to use when invoking 'createMasterTx'.
  func makeCreateMasterTxInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_CreateMasterTxRequest, Axelar_Bitcoin_V1beta1_CreateMasterTxResponse>]

  /// - Returns: Interceptors to use when invoking 'createRescueTx'.
  func makeCreateRescueTxInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_CreateRescueTxRequest, Axelar_Bitcoin_V1beta1_CreateRescueTxResponse>]

  /// - Returns: Interceptors to use when invoking 'signTx'.
  func makeSignTxInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_SignTxRequest, Axelar_Bitcoin_V1beta1_SignTxResponse>]

  /// - Returns: Interceptors to use when invoking 'submitExternalSignature'.
  func makeSubmitExternalSignatureInterceptors() -> [ClientInterceptor<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest, Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse>]
}

internal final class Axelar_Bitcoin_V1beta1_MsgServiceClient: Axelar_Bitcoin_V1beta1_MsgServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Axelar_Bitcoin_V1beta1_MsgServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the axelar.bitcoin.v1beta1.MsgService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Axelar_Bitcoin_V1beta1_MsgServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the bitcoin Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Axelar_Bitcoin_V1beta1_MsgServiceProvider: CallHandlerProvider {
  var interceptors: Axelar_Bitcoin_V1beta1_MsgServiceServerInterceptorFactoryProtocol? { get }

  func link(request: Axelar_Bitcoin_V1beta1_LinkRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_LinkResponse>

  func confirmOutpoint(request: Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse>

  func voteConfirmOutpoint(request: Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse>

  func createPendingTransfersTx(request: Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse>

  func createMasterTx(request: Axelar_Bitcoin_V1beta1_CreateMasterTxRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_CreateMasterTxResponse>

  func createRescueTx(request: Axelar_Bitcoin_V1beta1_CreateRescueTxRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_CreateRescueTxResponse>

  func signTx(request: Axelar_Bitcoin_V1beta1_SignTxRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_SignTxResponse>

  func submitExternalSignature(request: Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse>
}

extension Axelar_Bitcoin_V1beta1_MsgServiceProvider {
  internal var serviceName: Substring { return "axelar.bitcoin.v1beta1.MsgService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Link":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_LinkRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_LinkResponse>(),
        interceptors: self.interceptors?.makeLinkInterceptors() ?? [],
        userFunction: self.link(request:context:)
      )

    case "ConfirmOutpoint":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse>(),
        interceptors: self.interceptors?.makeConfirmOutpointInterceptors() ?? [],
        userFunction: self.confirmOutpoint(request:context:)
      )

    case "VoteConfirmOutpoint":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse>(),
        interceptors: self.interceptors?.makeVoteConfirmOutpointInterceptors() ?? [],
        userFunction: self.voteConfirmOutpoint(request:context:)
      )

    case "CreatePendingTransfersTx":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse>(),
        interceptors: self.interceptors?.makeCreatePendingTransfersTxInterceptors() ?? [],
        userFunction: self.createPendingTransfersTx(request:context:)
      )

    case "CreateMasterTx":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_CreateMasterTxRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_CreateMasterTxResponse>(),
        interceptors: self.interceptors?.makeCreateMasterTxInterceptors() ?? [],
        userFunction: self.createMasterTx(request:context:)
      )

    case "CreateRescueTx":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_CreateRescueTxRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_CreateRescueTxResponse>(),
        interceptors: self.interceptors?.makeCreateRescueTxInterceptors() ?? [],
        userFunction: self.createRescueTx(request:context:)
      )

    case "SignTx":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_SignTxRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_SignTxResponse>(),
        interceptors: self.interceptors?.makeSignTxInterceptors() ?? [],
        userFunction: self.signTx(request:context:)
      )

    case "SubmitExternalSignature":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest>(),
        responseSerializer: ProtobufSerializer<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse>(),
        interceptors: self.interceptors?.makeSubmitExternalSignatureInterceptors() ?? [],
        userFunction: self.submitExternalSignature(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Axelar_Bitcoin_V1beta1_MsgServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'link'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLinkInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_LinkRequest, Axelar_Bitcoin_V1beta1_LinkResponse>]

  /// - Returns: Interceptors to use when handling 'confirmOutpoint'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConfirmOutpointInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_ConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_ConfirmOutpointResponse>]

  /// - Returns: Interceptors to use when handling 'voteConfirmOutpoint'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeVoteConfirmOutpointInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_VoteConfirmOutpointRequest, Axelar_Bitcoin_V1beta1_VoteConfirmOutpointResponse>]

  /// - Returns: Interceptors to use when handling 'createPendingTransfersTx'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreatePendingTransfersTxInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxRequest, Axelar_Bitcoin_V1beta1_CreatePendingTransfersTxResponse>]

  /// - Returns: Interceptors to use when handling 'createMasterTx'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateMasterTxInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_CreateMasterTxRequest, Axelar_Bitcoin_V1beta1_CreateMasterTxResponse>]

  /// - Returns: Interceptors to use when handling 'createRescueTx'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateRescueTxInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_CreateRescueTxRequest, Axelar_Bitcoin_V1beta1_CreateRescueTxResponse>]

  /// - Returns: Interceptors to use when handling 'signTx'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSignTxInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_SignTxRequest, Axelar_Bitcoin_V1beta1_SignTxResponse>]

  /// - Returns: Interceptors to use when handling 'submitExternalSignature'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSubmitExternalSignatureInterceptors() -> [ServerInterceptor<Axelar_Bitcoin_V1beta1_SubmitExternalSignatureRequest, Axelar_Bitcoin_V1beta1_SubmitExternalSignatureResponse>]
}