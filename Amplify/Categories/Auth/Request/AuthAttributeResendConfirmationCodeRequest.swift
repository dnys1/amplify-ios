//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// swiftlint:disable:next type_name
public struct AuthAttributeResendConfirmationCodeRequest: AmplifyOperationRequest {

    /// <#Description#>
    public let attributeKey: AuthUserAttributeKey

    /// <#Description#>
    public var options: Options

    /// <#Description#>
    /// - Parameters:
    ///   - attributeKey: <#attributeKey description#>
    ///   - options: <#options description#>
    public init(attributeKey: AuthUserAttributeKey,
                options: Options) {
        self.attributeKey = attributeKey
        self.options = options
    }
}

public extension AuthAttributeResendConfirmationCodeRequest {

    /// <#Description#>
    struct Options {

        /// Extra plugin specific options, only used in special circumstances when the existing options do not provide
        /// a way to utilize the underlying auth plugin functionality. See plugin documentation for expected
        /// key/values
        public let pluginOptions: Any?

        /// <#Description#>
        /// - Parameter pluginOptions: <#pluginOptions description#>
        public init(pluginOptions: Any? = nil) {
            self.pluginOptions = pluginOptions
        }
    }
}
