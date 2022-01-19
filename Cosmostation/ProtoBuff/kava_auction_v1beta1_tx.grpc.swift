//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/auction/v1beta1/tx.proto
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


/// Msg defines the auction Msg service.
///
/// Usage: instantiate `Kava_Auction_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Auction_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Auction_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func placeBid(
    _ request: Kava_Auction_V1beta1_MsgPlaceBid,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Auction_V1beta1_MsgPlaceBid, Kava_Auction_V1beta1_MsgPlaceBidResponse>
}

extension Kava_Auction_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "kava.auction.v1beta1.Msg"
  }

  /// PlaceBid message type used by bidders to place bids on auctions
  ///
  /// - Parameters:
  ///   - request: Request to send to PlaceBid.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func placeBid(
    _ request: Kava_Auction_V1beta1_MsgPlaceBid,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Auction_V1beta1_MsgPlaceBid, Kava_Auction_V1beta1_MsgPlaceBidResponse> {
    return self.makeUnaryCall(
      path: "/kava.auction.v1beta1.Msg/PlaceBid",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlaceBidInterceptors() ?? []
    )
  }
}

internal protocol Kava_Auction_V1beta1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'placeBid'.
  func makePlaceBidInterceptors() -> [ClientInterceptor<Kava_Auction_V1beta1_MsgPlaceBid, Kava_Auction_V1beta1_MsgPlaceBidResponse>]
}

internal final class Kava_Auction_V1beta1_MsgClient: Kava_Auction_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Auction_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.auction.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Auction_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the auction Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Auction_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Kava_Auction_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// PlaceBid message type used by bidders to place bids on auctions
  func placeBid(request: Kava_Auction_V1beta1_MsgPlaceBid, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Auction_V1beta1_MsgPlaceBidResponse>
}

extension Kava_Auction_V1beta1_MsgProvider {
  internal var serviceName: Substring { return "kava.auction.v1beta1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "PlaceBid":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Auction_V1beta1_MsgPlaceBid>(),
        responseSerializer: ProtobufSerializer<Kava_Auction_V1beta1_MsgPlaceBidResponse>(),
        interceptors: self.interceptors?.makePlaceBidInterceptors() ?? [],
        userFunction: self.placeBid(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Auction_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'placeBid'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePlaceBidInterceptors() -> [ServerInterceptor<Kava_Auction_V1beta1_MsgPlaceBid, Kava_Auction_V1beta1_MsgPlaceBidResponse>]
}
