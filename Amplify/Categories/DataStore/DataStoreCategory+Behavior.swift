//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension DataStoreCategory: DataStoreBaseBehavior {

    /// <#Description#>
    /// - Parameters:
    ///   - model: <#model description#>
    ///   - condition: <#condition description#>
    ///   - completion: <#completion description#>
    public func save<M: Model>(_ model: M,
                               where condition: QueryPredicate? = nil,
                               completion: @escaping DataStoreCallback<M>) {
        plugin.save(model, where: condition, completion: completion)
    }


    /// <#Description#>
    /// - Parameters:
    ///   - modelType: <#modelType description#>
    ///   - id: <#id description#>
    ///   - completion: <#completion description#>
    public func query<M: Model>(_ modelType: M.Type,
                                byId id: String,
                                completion: DataStoreCallback<M?>) {
        plugin.query(modelType, byId: id, completion: completion)
    }

    /// <#Description#>
    /// - Parameters:
    ///   - modelType: <#modelType description#>
    ///   - predicate: <#predicate description#>
    ///   - sortInput: <#sortInput description#>
    ///   - paginationInput: <#paginationInput description#>
    ///   - completion: <#completion description#>
    public func query<M: Model>(_ modelType: M.Type,
                                where predicate: QueryPredicate? = nil,
                                sort sortInput: QuerySortInput? = nil,
                                paginate paginationInput: QueryPaginationInput? = nil,
                                completion: DataStoreCallback<[M]>) {
        plugin.query(modelType, where: predicate, sort: sortInput, paginate: paginationInput, completion: completion)
    }


    /// <#Description#>
    /// - Parameters:
    ///   - model: <#model description#>
    ///   - predicate: <#predicate description#>
    ///   - completion: <#completion description#>
    public func delete<M: Model>(_ model: M,
                                 where predicate: QueryPredicate? = nil,
                                 completion: @escaping DataStoreCallback<Void>) {
        plugin.delete(model, where: predicate, completion: completion)
    }


    /// <#Description#>
    /// - Parameters:
    ///   - modelType: <#modelType description#>
    ///   - id: <#id description#>
    ///   - predicate: <#predicate description#>
    ///   - completion: <#completion description#>
    public func delete<M: Model>(_ modelType: M.Type,
                                 withId id: String,
                                 where predicate: QueryPredicate? = nil,
                                 completion: @escaping DataStoreCallback<Void>) {
        plugin.delete(modelType, withId: id, where: predicate, completion: completion)
    }

    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    public func start(completion: @escaping DataStoreCallback<Void>) {
        plugin.start(completion: completion)
    }

    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    public func stop(completion: @escaping DataStoreCallback<Void>) {
        plugin.stop(completion: completion)
    }

    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    public func clear(completion: @escaping DataStoreCallback<Void>) {
        plugin.clear(completion: completion)
    }
}
