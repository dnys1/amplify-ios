//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension AmplifyAPICategory: APICategoryGraphQLBehavior {

    // MARK: - Request-based GraphQL operations

    /// <#Description#>
    /// - Parameters:
    ///   - request: <#request description#>
    ///   - listener: <#listener description#>
    /// - Returns: <#description#>
    @discardableResult
    public func query<R: Decodable>(request: GraphQLRequest<R>,
                                    listener: GraphQLOperation<R>.ResultListener?) -> GraphQLOperation<R> {
        plugin.query(request: request, listener: listener)
    }

    /// <#Description#>
    /// - Parameters:
    ///   - request: <#request description#>
    ///   - listener: <#listener description#>
    /// - Returns: <#description#>
    @discardableResult
    public func mutate<R: Decodable>(request: GraphQLRequest<R>,
                                     listener: GraphQLOperation<R>.ResultListener?) -> GraphQLOperation<R> {
        plugin.mutate(request: request, listener: listener)
    }

    /// <#Description#>
    /// - Parameters:
    ///   - request: <#request description#>
    ///   - valueListener: <#valueListener description#>
    ///   - completionListener: <#completionListener description#>
    /// - Returns: <#description#>
    public func subscribe<R>(request: GraphQLRequest<R>,
                             valueListener: GraphQLSubscriptionOperation<R>.InProcessListener?,
                             completionListener: GraphQLSubscriptionOperation<R>.ResultListener?)
        -> GraphQLSubscriptionOperation<R> {
            plugin.subscribe(request: request, valueListener: valueListener, completionListener: completionListener)
    }
}
