//
//  SearchViewModelTests.swift
//  SearchFeatureUnitTests
//
//  Created by Lori Montenegro on 20/06/24.
//

import XCTest
@testable import SearchFeature

final class SearchViewModelTests: XCTestCase {
    
    let serviceMock = ServiceMock()
    let dataStructureMock = DataStructureMock.create()
    
    var viewModel: SearchViewModel?
    
    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(service: serviceMock, dataStructure: dataStructureMock)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSarchViewModel_fetchData() throws {
        guard let viewModel = viewModel else {
            XCTFail("viewModel was not instantiated")
            return
        }
        viewModel.fetchData()

        XCTAssertEqual(viewModel.names, ["name1", "name2"])
        XCTAssertEqual(serviceMock.calledFetchNamesCount, 1)
        XCTAssertEqual(dataStructureMock.calledInsertCount, 1)
        XCTAssertEqual(dataStructureMock.insertArgument, ["name1", "name2"])
    }
    
    func testSarchViewModel_textFieldDidChange() throws {
        guard let viewModel = viewModel else {
            XCTFail("viewModel was not instantiated")
            return
        }
        viewModel.textFieldInput = "some other string"
        
        XCTAssertEqual(dataStructureMock.calledMatchingNamesCount, 1)
        XCTAssertEqual(dataStructureMock.matchingNamesArgument, "some other string")
        XCTAssertEqual(viewModel.names, dataStructureMock.matchingNamesReturn)
    }

}
