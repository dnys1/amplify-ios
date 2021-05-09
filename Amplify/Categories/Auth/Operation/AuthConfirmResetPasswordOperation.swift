//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// <#Description#>
public protocol AuthConfirmResetPasswordOperation: AmplifyOperation<
    AuthConfirmResetPasswordRequest,
    Void,
    AuthError
> {}

public extension HubPayload.EventName.Auth {

    /// eventName for HubPayloads emitted by this operation
    static let confirmResetPasswordAPI = "Auth.confirmResetPasswordAPI"
}
