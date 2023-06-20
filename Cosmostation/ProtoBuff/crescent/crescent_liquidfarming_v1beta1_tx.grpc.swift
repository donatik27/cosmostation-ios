//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: crescent/liquidfarming/v1beta1/tx.proto
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


/// Msg defines the Msg service.
///
/// Usage: instantiate `Crescent_Liquidfarming_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Crescent_Liquidfarming_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func liquidFarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>

  func liquidUnfarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>

  func liquidUnfarmAndWithdraw(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>

  func placeBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>

  func refundBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>

  func advanceAuction(
    _ request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>
}

extension Crescent_Liquidfarming_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "crescent.liquidfarming.v1beta1.Msg"
  }

  /// LiquidFarm defines a method for farming pool coin for a liquid farm
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidFarm.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidFarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidFarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidFarmInterceptors() ?? []
    )
  }

  /// LiquidUnfarm defines a method for unfarming amount of LFCoin
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidUnfarm.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidUnfarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmInterceptors() ?? []
    )
  }

  /// LiquidUnfarmAndWithdraw defines a method for unfarming amount of LFCoin and withdraw pool coin from the pool
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidUnfarmAndWithdraw.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidUnfarmAndWithdraw(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarmAndWithdraw.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmAndWithdrawInterceptors() ?? []
    )
  }

  /// PlaceBid defines a method for placing a bid for a rewards auction
  ///
  /// - Parameters:
  ///   - request: Request to send to PlaceBid.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func placeBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.placeBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlaceBidInterceptors() ?? []
    )
  }

  /// RefundBid defines a method for refunding the bid that is not winning for the auction
  ///
  /// - Parameters:
  ///   - request: Request to send to RefundBid.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func refundBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.refundBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundBidInterceptors() ?? []
    )
  }

  /// AdvanceAuction defines a method for advancing rewards auction by one.
  /// This Msg is defined just for testing purpose and it shouldn't be used in production.
  ///
  /// - Parameters:
  ///   - request: Request to send to AdvanceAuction.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func advanceAuction(
    _ request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse> {
    return self.makeUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.advanceAuction.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAdvanceAuctionInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Crescent_Liquidfarming_V1beta1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Crescent_Liquidfarming_V1beta1_MsgNIOClient")
internal final class Crescent_Liquidfarming_V1beta1_MsgClient: Crescent_Liquidfarming_V1beta1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the crescent.liquidfarming.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Crescent_Liquidfarming_V1beta1_MsgNIOClient: Crescent_Liquidfarming_V1beta1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the crescent.liquidfarming.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the Msg service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Crescent_Liquidfarming_V1beta1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func makeLiquidFarmCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>

  func makeLiquidUnfarmCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>

  func makeLiquidUnfarmAndWithdrawCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>

  func makePlaceBidCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>

  func makeRefundBidCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>

  func makeAdvanceAuctionCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Crescent_Liquidfarming_V1beta1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Crescent_Liquidfarming_V1beta1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeLiquidFarmCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidFarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidFarmInterceptors() ?? []
    )
  }

  internal func makeLiquidUnfarmCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmInterceptors() ?? []
    )
  }

  internal func makeLiquidUnfarmAndWithdrawCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarmAndWithdraw.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmAndWithdrawInterceptors() ?? []
    )
  }

  internal func makePlaceBidCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.placeBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlaceBidInterceptors() ?? []
    )
  }

  internal func makeRefundBidCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.refundBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundBidInterceptors() ?? []
    )
  }

  internal func makeAdvanceAuctionCall(
    _ request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse> {
    return self.makeAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.advanceAuction.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAdvanceAuctionInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Crescent_Liquidfarming_V1beta1_MsgAsyncClientProtocol {
  internal func liquidFarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidFarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidFarmInterceptors() ?? []
    )
  }

  internal func liquidUnfarm(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarm.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmInterceptors() ?? []
    )
  }

  internal func liquidUnfarmAndWithdraw(
    _ request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarmAndWithdraw.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidUnfarmAndWithdrawInterceptors() ?? []
    )
  }

  internal func placeBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.placeBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlaceBidInterceptors() ?? []
    )
  }

  internal func refundBid(
    _ request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.refundBid.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundBidInterceptors() ?? []
    )
  }

  internal func advanceAuction(
    _ request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    callOptions: CallOptions? = nil
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse {
    return try await self.performAsyncUnaryCall(
      path: Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.advanceAuction.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeAdvanceAuctionInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Crescent_Liquidfarming_V1beta1_MsgAsyncClient: Crescent_Liquidfarming_V1beta1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Crescent_Liquidfarming_V1beta1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'liquidFarm'.
  func makeLiquidFarmInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>]

  /// - Returns: Interceptors to use when invoking 'liquidUnfarm'.
  func makeLiquidUnfarmInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>]

  /// - Returns: Interceptors to use when invoking 'liquidUnfarmAndWithdraw'.
  func makeLiquidUnfarmAndWithdrawInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>]

  /// - Returns: Interceptors to use when invoking 'placeBid'.
  func makePlaceBidInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>]

  /// - Returns: Interceptors to use when invoking 'refundBid'.
  func makeRefundBidInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>]

  /// - Returns: Interceptors to use when invoking 'advanceAuction'.
  func makeAdvanceAuctionInterceptors() -> [ClientInterceptor<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>]
}

internal enum Crescent_Liquidfarming_V1beta1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "crescent.liquidfarming.v1beta1.Msg",
    methods: [
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidFarm,
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarm,
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.liquidUnfarmAndWithdraw,
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.placeBid,
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.refundBid,
      Crescent_Liquidfarming_V1beta1_MsgClientMetadata.Methods.advanceAuction,
    ]
  )

  internal enum Methods {
    internal static let liquidFarm = GRPCMethodDescriptor(
      name: "LiquidFarm",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidFarm",
      type: GRPCCallType.unary
    )

    internal static let liquidUnfarm = GRPCMethodDescriptor(
      name: "LiquidUnfarm",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidUnfarm",
      type: GRPCCallType.unary
    )

    internal static let liquidUnfarmAndWithdraw = GRPCMethodDescriptor(
      name: "LiquidUnfarmAndWithdraw",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidUnfarmAndWithdraw",
      type: GRPCCallType.unary
    )

    internal static let placeBid = GRPCMethodDescriptor(
      name: "PlaceBid",
      path: "/crescent.liquidfarming.v1beta1.Msg/PlaceBid",
      type: GRPCCallType.unary
    )

    internal static let refundBid = GRPCMethodDescriptor(
      name: "RefundBid",
      path: "/crescent.liquidfarming.v1beta1.Msg/RefundBid",
      type: GRPCCallType.unary
    )

    internal static let advanceAuction = GRPCMethodDescriptor(
      name: "AdvanceAuction",
      path: "/crescent.liquidfarming.v1beta1.Msg/AdvanceAuction",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Crescent_Liquidfarming_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Crescent_Liquidfarming_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// LiquidFarm defines a method for farming pool coin for a liquid farm
  func liquidFarm(request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>

  /// LiquidUnfarm defines a method for unfarming amount of LFCoin
  func liquidUnfarm(request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>

  /// LiquidUnfarmAndWithdraw defines a method for unfarming amount of LFCoin and withdraw pool coin from the pool
  func liquidUnfarmAndWithdraw(request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>

  /// PlaceBid defines a method for placing a bid for a rewards auction
  func placeBid(request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>

  /// RefundBid defines a method for refunding the bid that is not winning for the auction
  func refundBid(request: Crescent_Liquidfarming_V1beta1_MsgRefundBid, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>

  /// AdvanceAuction defines a method for advancing rewards auction by one.
  /// This Msg is defined just for testing purpose and it shouldn't be used in production.
  func advanceAuction(request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>
}

extension Crescent_Liquidfarming_V1beta1_MsgProvider {
  internal var serviceName: Substring {
    return Crescent_Liquidfarming_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "LiquidFarm":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>(),
        interceptors: self.interceptors?.makeLiquidFarmInterceptors() ?? [],
        userFunction: self.liquidFarm(request:context:)
      )

    case "LiquidUnfarm":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>(),
        interceptors: self.interceptors?.makeLiquidUnfarmInterceptors() ?? [],
        userFunction: self.liquidUnfarm(request:context:)
      )

    case "LiquidUnfarmAndWithdraw":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>(),
        interceptors: self.interceptors?.makeLiquidUnfarmAndWithdrawInterceptors() ?? [],
        userFunction: self.liquidUnfarmAndWithdraw(request:context:)
      )

    case "PlaceBid":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgPlaceBid>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>(),
        interceptors: self.interceptors?.makePlaceBidInterceptors() ?? [],
        userFunction: self.placeBid(request:context:)
      )

    case "RefundBid":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgRefundBid>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>(),
        interceptors: self.interceptors?.makeRefundBidInterceptors() ?? [],
        userFunction: self.refundBid(request:context:)
      )

    case "AdvanceAuction":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>(),
        interceptors: self.interceptors?.makeAdvanceAuctionInterceptors() ?? [],
        userFunction: self.advanceAuction(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the Msg service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Crescent_Liquidfarming_V1beta1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Crescent_Liquidfarming_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// LiquidFarm defines a method for farming pool coin for a liquid farm
  @Sendable func liquidFarm(
    request: Crescent_Liquidfarming_V1beta1_MsgLiquidFarm,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse

  /// LiquidUnfarm defines a method for unfarming amount of LFCoin
  @Sendable func liquidUnfarm(
    request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse

  /// LiquidUnfarmAndWithdraw defines a method for unfarming amount of LFCoin and withdraw pool coin from the pool
  @Sendable func liquidUnfarmAndWithdraw(
    request: Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse

  /// PlaceBid defines a method for placing a bid for a rewards auction
  @Sendable func placeBid(
    request: Crescent_Liquidfarming_V1beta1_MsgPlaceBid,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse

  /// RefundBid defines a method for refunding the bid that is not winning for the auction
  @Sendable func refundBid(
    request: Crescent_Liquidfarming_V1beta1_MsgRefundBid,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse

  /// AdvanceAuction defines a method for advancing rewards auction by one.
  /// This Msg is defined just for testing purpose and it shouldn't be used in production.
  @Sendable func advanceAuction(
    request: Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction,
    context: GRPCAsyncServerCallContext
  ) async throws -> Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Crescent_Liquidfarming_V1beta1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Crescent_Liquidfarming_V1beta1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Crescent_Liquidfarming_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Crescent_Liquidfarming_V1beta1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "LiquidFarm":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>(),
        interceptors: self.interceptors?.makeLiquidFarmInterceptors() ?? [],
        wrapping: self.liquidFarm(request:context:)
      )

    case "LiquidUnfarm":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>(),
        interceptors: self.interceptors?.makeLiquidUnfarmInterceptors() ?? [],
        wrapping: self.liquidUnfarm(request:context:)
      )

    case "LiquidUnfarmAndWithdraw":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>(),
        interceptors: self.interceptors?.makeLiquidUnfarmAndWithdrawInterceptors() ?? [],
        wrapping: self.liquidUnfarmAndWithdraw(request:context:)
      )

    case "PlaceBid":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgPlaceBid>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>(),
        interceptors: self.interceptors?.makePlaceBidInterceptors() ?? [],
        wrapping: self.placeBid(request:context:)
      )

    case "RefundBid":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgRefundBid>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>(),
        interceptors: self.interceptors?.makeRefundBidInterceptors() ?? [],
        wrapping: self.refundBid(request:context:)
      )

    case "AdvanceAuction":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction>(),
        responseSerializer: ProtobufSerializer<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>(),
        interceptors: self.interceptors?.makeAdvanceAuctionInterceptors() ?? [],
        wrapping: self.advanceAuction(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Crescent_Liquidfarming_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'liquidFarm'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidFarmInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidFarm, Crescent_Liquidfarming_V1beta1_MsgLiquidFarmResponse>]

  /// - Returns: Interceptors to use when handling 'liquidUnfarm'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidUnfarmInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarm, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmResponse>]

  /// - Returns: Interceptors to use when handling 'liquidUnfarmAndWithdraw'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidUnfarmAndWithdrawInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdraw, Crescent_Liquidfarming_V1beta1_MsgLiquidUnfarmAndWithdrawResponse>]

  /// - Returns: Interceptors to use when handling 'placeBid'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePlaceBidInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgPlaceBid, Crescent_Liquidfarming_V1beta1_MsgPlaceBidResponse>]

  /// - Returns: Interceptors to use when handling 'refundBid'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRefundBidInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgRefundBid, Crescent_Liquidfarming_V1beta1_MsgRefundBidResponse>]

  /// - Returns: Interceptors to use when handling 'advanceAuction'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeAdvanceAuctionInterceptors() -> [ServerInterceptor<Crescent_Liquidfarming_V1beta1_MsgAdvanceAuction, Crescent_Liquidfarming_V1beta1_MsgAdvanceAuctionResponse>]
}

internal enum Crescent_Liquidfarming_V1beta1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "crescent.liquidfarming.v1beta1.Msg",
    methods: [
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.liquidFarm,
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.liquidUnfarm,
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.liquidUnfarmAndWithdraw,
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.placeBid,
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.refundBid,
      Crescent_Liquidfarming_V1beta1_MsgServerMetadata.Methods.advanceAuction,
    ]
  )

  internal enum Methods {
    internal static let liquidFarm = GRPCMethodDescriptor(
      name: "LiquidFarm",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidFarm",
      type: GRPCCallType.unary
    )

    internal static let liquidUnfarm = GRPCMethodDescriptor(
      name: "LiquidUnfarm",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidUnfarm",
      type: GRPCCallType.unary
    )

    internal static let liquidUnfarmAndWithdraw = GRPCMethodDescriptor(
      name: "LiquidUnfarmAndWithdraw",
      path: "/crescent.liquidfarming.v1beta1.Msg/LiquidUnfarmAndWithdraw",
      type: GRPCCallType.unary
    )

    internal static let placeBid = GRPCMethodDescriptor(
      name: "PlaceBid",
      path: "/crescent.liquidfarming.v1beta1.Msg/PlaceBid",
      type: GRPCCallType.unary
    )

    internal static let refundBid = GRPCMethodDescriptor(
      name: "RefundBid",
      path: "/crescent.liquidfarming.v1beta1.Msg/RefundBid",
      type: GRPCCallType.unary
    )

    internal static let advanceAuction = GRPCMethodDescriptor(
      name: "AdvanceAuction",
      path: "/crescent.liquidfarming.v1beta1.Msg/AdvanceAuction",
      type: GRPCCallType.unary
    )
  }
}
