//
//  SearchServiceTests.swift
//  SearchFeatureUnitTests
//
//  Created by Lori Montenegro on 21/06/24.
//

import XCTest
import LocalData
@testable import SearchFeature

final class SearchServiceTests: XCTestCase {
    
    var searchService: SearchService!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        let path = bundle.url(forResource: "providersMock", withExtension: "json")
        searchService = SearchService(jsonPath: path)
    }
    
    override func tearDown() {
        searchService = nil
        super.tearDown()
    }
    
    func testSearchService_fetchNames() {
        XCTAssertEqual(searchService.fetchNames(), ["A+ Morumbi"])
    }
    
}
