//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public enum ModelAttribute {

    /// Represents a database index, often used for frequent query optimizations.
    case index

    /// This model is used by the Amplify system or a plugin, and should not be used by the app developer
    case isSystem
}

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public enum ModelFieldAttribute {
    case primaryKey
}

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public struct ModelField {

    /// <#Description#>
    public let name: String

    /// <#Description#>
    public let type: ModelFieldType

    /// <#Description#>
    public let isRequired: Bool

    /// <#Description#>
    public let isReadOnly: Bool

    /// <#Description#>
    public let isArray: Bool

    /// <#Description#>
    public let attributes: [ModelFieldAttribute]

    /// <#Description#>
    public let association: ModelAssociation?

    /// <#Description#>
    public let authRules: AuthRules

    /// <#Description#>
    public var isPrimaryKey: Bool {
        return name == "id"
    }

    /// <#Description#>
    /// - Parameters:
    ///   - name: <#name description#>
    ///   - type: <#type description#>
    ///   - isRequired: <#isRequired description#>
    ///   - isReadOnly: <#isReadOnly description#>
    ///   - isArray: <#isArray description#>
    ///   - attributes: <#attributes description#>
    ///   - association: <#association description#>
    ///   - authRules: <#authRules description#>
    public init(name: String,
                type: ModelFieldType,
                isRequired: Bool = false,
                isReadOnly: Bool = false,
                isArray: Bool = false,
                attributes: [ModelFieldAttribute] = [],
                association: ModelAssociation? = nil,
                authRules: AuthRules = []) {
        self.name = name
        self.type = type
        self.isRequired = isRequired
        self.isReadOnly = isReadOnly
        self.isArray = isArray
        self.attributes = attributes
        self.association = association
        self.authRules = authRules
    }
}

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public typealias ModelFields = [String: ModelField]

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public typealias ModelName = String

/// - Warning: Although this has `public` access, it is intended for internal & codegen use and should not be used
///   directly by host applications. The behavior of this may change without warning.
public struct ModelSchema {

    /// <#Description#>
    public let name: String

    /// <#Description#>
    public let pluralName: String?

    /// <#Description#>
    public let authRules: AuthRules

    /// <#Description#>
    public let fields: ModelFields

    /// <#Description#>
    public let attributes: [ModelAttribute]

    /// <#Description#>
    public let sortedFields: [ModelField]

    /// <#Description#>
    public var primaryKey: ModelField {
        guard let primaryKey = fields.first(where: { $1.isPrimaryKey }) else {
            preconditionFailure("Primary Key not defined for `\(name)`")
        }
        return primaryKey.value
    }

    /// <#Description#>
    /// - Parameters:
    ///   - name: <#name description#>
    ///   - pluralName: <#pluralName description#>
    ///   - authRules: <#authRules description#>
    ///   - attributes: <#attributes description#>
    ///   - fields: <#fields description#>
    public init(name: String,
                pluralName: String? = nil,
                authRules: AuthRules = [],
                attributes: [ModelAttribute] = [],
                fields: ModelFields = [:]) {
        self.name = name
        self.pluralName = pluralName
        self.authRules = authRules
        self.attributes = attributes
        self.fields = fields

        self.sortedFields = fields.sortedFields()
    }

    /// <#Description#>
    /// - Parameter name: <#name description#>
    /// - Returns: <#description#>
    public func field(withName name: String) -> ModelField? {
        return fields[name]
    }

}

extension Dictionary where Key == String, Value == ModelField {

    /// Returns an array of the values sorted by some pre-defined rules:
    ///
    /// 1. primary key always comes first
    /// 2. foreign keys always come at the end
    /// 3. the remaining fields are sorted alphabetically
    ///
    /// This is useful so code that uses the fields to generate queries and other
    /// persistence-related operations guarantee that the results are always consistent.
    func sortedFields() -> [Value] {
        return values.sorted { one, other in
            if one.isPrimaryKey {
                return true
            }
            if other.isPrimaryKey {
                return false
            }
            if one.hasAssociation && !other.hasAssociation {
                return false
            }
            if !one.hasAssociation && other.hasAssociation {
                return true
            }
            return one.name < other.name
        }
    }
}
