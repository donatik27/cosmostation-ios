//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: em/issuer/v1/query.proto
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


/// Usage: instantiate `Em_Issuer_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Em_Issuer_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Em_Issuer_V1_QueryClientInterceptorFactoryProtocol? { get }

  func issuers(
    _ request: Em_Issuer_V1_QueryIssuersRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Em_Issuer_V1_QueryIssuersRequest, Em_Issuer_V1_QueryIssuersResponse>
}

extension Em_Issuer_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "em.issuer.v1.Query"
  }

  /// Unary call to Issuers
  ///
  /// - Parameters:
  ///   - request: Request to send to Issuers.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func issuers(
    _ request: Em_Issuer_V1_QueryIssuersRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Em_Issuer_V1_QueryIssuersRequest, Em_Issuer_V1_QueryIssuersResponse> {
    return self.makeUnaryCall(
      path: "/em.issuer.v1.Query/Issuers",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeIssuersInterceptors() ?? []
    )
  }
}

internal protocol Em_Issuer_V1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'issuers'.
  func makeIssuersInterceptors() -> [ClientInterceptor<Em_Issuer_V1_QueryIssuersRequest, Em_Issuer_V1_QueryIssuersResponse>]
}

internal final class Em_Issuer_V1_QueryClient: Em_Issuer_V1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Em_Issuer_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the em.issuer.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Em_Issuer_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Em_Issuer_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Em_Issuer_V1_QueryServerInterceptorFactoryProtocol? { get }

  func issuers(request: Em_Issuer_V1_QueryIssuersRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Em_Issuer_V1_QueryIssuersResponse>
}

extension Em_Issuer_V1_QueryProvider {
  internal var serviceName: Substring { return "em.issuer.v1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Issuers":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Em_Issuer_V1_QueryIssuersRequest>(),
        responseSerializer: ProtobufSerializer<Em_Issuer_V1_QueryIssuersResponse>(),
        interceptors: self.interceptors?.makeIssuersInterceptors() ?? [],
        userFunction: self.issuers(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Em_Issuer_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'issuers'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeIssuersInterceptors() -> [ServerInterceptor<Em_Issuer_V1_QueryIssuersRequest, Em_Issuer_V1_QueryIssuersResponse>]
}