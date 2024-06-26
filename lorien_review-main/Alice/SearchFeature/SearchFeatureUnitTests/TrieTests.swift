//
//  SearchFeatureUnitTests.swift
//  SearchFeatureUnitTests
//
//  Created by Lori Montenegro on 19/06/24.
//

import XCTest
@testable import SearchFeature
@testable import LocalData

final class TrieTests: XCTestCase {
    
    var trie: Trie?
    
    override func setUp() {
        super.setUp()
        trie = Trie.create()
    }
    
    override func tearDown() {
        trie = nil
        super.tearDown()
    }
    
    func testTrie_insert() throws {
        guard let trie = trie else {
            XCTFail("Trie was not instantiated")
            return
        }
        XCTAssertEqual(trie.root.children.count, 0)

        trie.insert(["ema"])
        XCTAssertEqual(trie.root.children.count, 1)
    }

    func testTrie_matchingNames() throws {
        guard let trie = trie else {
            XCTFail("Trie was not instantiated")
            return
        }
        
        let names = ["ema", "emma", "eme", "eva", "jose"]
        trie.insert(names)
        let matchingNames = trie.matchingNames(with: "em")
        let expectedMatchingNames = ["ema", "emma", "eme"]
        
        XCTAssertEqual(matchingNames, expectedMatchingNames)
    }

}
