//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AmplifyPlugins
import AWSMobileClient

@testable import Amplify
@testable import AmplifyTestCommon
@testable import AWSDataStoreCategoryPlugin

class DataStoreScalarTests: SyncEngineIntegrationTestBase {

    func testScalarContainer() throws {
        try startAmplifyAndWaitForSync()
        let container = ScalarContainer(myString: "myString",
                                        myInt: 1,
                                        myDouble: 1.0,
                                        myBool: true,
                                        myDate: .now(),
                                        myTime: .now(),
                                        myDateTime: .now(),
                                        myTimeStamp: 123,
                                        myEmail: "local-part@domain-part",
                                        myJSON: "{}",
                                        myPhone: "2342355678",
                                        myURL: "https://www.amazon.com/dp/B000NZW3KC/",
                                        myIPAddress: "123.12.34.56")
        let updatedContainer = ScalarContainer(id: container.id)
        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(ScalarContainer.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(ScalarContainer.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

    func testListIntContainer() throws {
        try startAmplifyAndWaitForSync()
        let container = ListIntContainer(
            test: 1,
            nullableInt: 1,
            intList: [],
            intNullableList: [],
            nullableIntList: [],
            nullableIntNullableList: nil)

        let updatedContainer = ListIntContainer(id: container.id,
                                                test: 2,
                                                nullableInt: nil,
                                                intList: [1, 2, 3],
                                                intNullableList: [1, 2, 3],
                                                nullableIntList: [1, 2, 3],
                                                nullableIntNullableList: [1, 2, 3])
        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(ListIntContainer.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(ListIntContainer.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

    func testListStringContainer() throws {
        try startAmplifyAndWaitForSync()
        let container = ListStringContainer(
            test: "test",
            nullableString: nil,
            stringList: ["value1"],
            stringNullableList: [],
            nullableStringList: [],
            nullableStringNullableList: nil)

        let updatedContainer = ListStringContainer(id: container.id,
                                                   test: "test",
                                                   nullableString: "test",
                                                   stringList: ["value1"],
                                                   stringNullableList: ["value1"],
                                                   nullableStringList: ["value1"],
                                                   nullableStringNullableList: ["value1"])
        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(ListStringContainer.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(ListStringContainer.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

    // TODO: Not sure how this was compiling and tested before, should be fixed with
    // https://github.com/aws-amplify/amplify-ios/pull/1145
    func testListContainerWithNil() throws {
        try startAmplifyAndWaitForSync()
        let container = ListStringContainer(
            test: "test",
            nullableString: nil,
            stringList: ["value1"],
            stringNullableList: [], // TODO: test with `nil` with new codegen feature
            nullableStringList: ["value1"], // TODO: test with `[nil]`
            nullableStringNullableList: nil)

        let updatedContainer = ListStringContainer(id: container.id,
                                                   test: "test",
                                                   nullableString: "test",
                                                   stringList: ["value1"],
                                                   stringNullableList: ["value1"],
                                                   nullableStringList: ["value1"],
                                                   nullableStringNullableList: ["value1"])
        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(ListStringContainer.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(ListStringContainer.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

    func testEnumTestModel() throws {
        try startAmplifyAndWaitForSync()
        let container = EnumTestModel(enumVal: .valueOne,
                                      nullableEnumVal: .valueTwo,
                                      enumList: [.valueOne],
                                      enumNullableList: [.valueTwo],
                                      nullableEnumList: [.valueOne, .valueTwo],
                                      nullableEnumNullableList: [.valueTwo, .valueOne])
        let updatedContainer = EnumTestModel(id: container.id,
                                             enumVal: .valueTwo,
                                             nullableEnumVal: nil,
                                             enumList: [.valueTwo],
                                             enumNullableList: [.valueTwo, .valueOne],
                                             nullableEnumList: [.valueTwo, .valueOne],
                                             nullableEnumNullableList: [.valueOne, .valueTwo])
        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(EnumTestModel.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(EnumTestModel.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

    func testNestedEnumTestModel() throws {
        try startAmplifyAndWaitForSync()
        let container = NestedTypeTestModel(nestedVal: .init(valueOne: 1),
                                            nullableNestedVal: .init(),
                                            nestedList: [.init(valueTwo: "value2")],
                                            nestedNullableList: [.init()],
                                            nullableNestedList: [.init(valueOne: 1, valueTwo: "value2")],
                                            nullableNestedNullableList: [.init(valueOne: 1, valueTwo: "value2")])

        let updatedContainer = NestedTypeTestModel(id: container.id,
                                                   nestedVal: .init(valueOne: 1),
                                                   nullableNestedVal: .init(),
                                                   nestedList: [.init(valueTwo: "updatedValue"), .init(valueOne: 1)],
                                                   nestedNullableList: [.init(valueOne: 1, valueTwo: "value2")],
                                                   nullableNestedList: [],
                                                   nullableNestedNullableList: nil)

        guard case .success(let savedModel) = saveModel(container) else {
            XCTFail("Failed to save model")
            return
        }
        XCTAssertEqual(savedModel, container)

        guard case .success(let updatedModel) = saveModel(updatedContainer) else {
            XCTFail("Failed to update model")
            return
        }
        XCTAssertEqual(updatedModel, updatedContainer)

        guard case .success(let queriedModel) = queryModel(NestedTypeTestModel.self, byId: container.id) else {
            XCTFail("Failed to query model")
            return
        }
        XCTAssertEqual(queriedModel, updatedContainer)

        guard case .success = deleteModel(updatedContainer) else {
            XCTFail("Failed to delete model")
            return
        }
        guard case .success(let emptyModel) = queryModel(NestedTypeTestModel.self, byId: container.id) else {
            XCTFail("Failed to query deleted model")
            return
        }
        XCTAssertNil(emptyModel)
    }

}
