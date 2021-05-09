//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public extension JSONValue {

    /// <#Description#>
    /// - Parameter keyPath: <#keyPath description#>
    /// - Returns: <#description#>
    func value(at keyPath: String) -> JSONValue? {
        value(at: keyPath, separatedBy: ".")
    }

    /// <#Description#>
    /// - Parameters:
    ///   - keyPath: <#keyPath description#>
    ///   - separator: <#separator description#>
    /// - Returns: <#description#>
    func value<T: StringProtocol>(at keyPath: String,
                                  separatedBy separator: T) -> JSONValue? {
        let pathComponents = keyPath.components(separatedBy: separator)
        let value = pathComponents.reduce(self) { currVal, nextVal in currVal?[nextVal] }
        return value
    }

    /// <#Description#>
    /// - Parameters:
    ///   - keyPath: <#keyPath description#>
    ///   - defaultValue: <#defaultValue description#>
    /// - Returns: <#description#>
    func value(at keyPath: String, withDefault defaultValue: JSONValue) -> JSONValue {
        guard let jsonValue = value(at: keyPath) else {
            return defaultValue
        }
        if case .null = jsonValue {
            return defaultValue
        }
        return jsonValue
    }
}
