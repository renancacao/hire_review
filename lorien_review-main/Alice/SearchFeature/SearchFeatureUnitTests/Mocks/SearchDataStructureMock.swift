//
//  SearchDataStructureMock.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 21/06/24.
//

import Foundation

final class DataStructureMock: SearchDataStructure {
    
    var calledInsertCount: Int = 0
    var insertArgument: [String]?
    var calledMatchingNamesCount: Int = 0
    var matchingNamesArgument: String?
    var matchingNamesReturn: [String]?
    
    static func create() -> DataStructureMock {
        .init()
    }
    
    func insert(_ words: [String]) {
        calledInsertCount += 1
        insertArgument = words
    }
    
    func insert(_ word: String) { }
    
    func matchingNames(with prefix: String) -> [String] {
        calledMatchingNamesCount += 1
        matchingNamesArgument = prefix
        matchingNamesReturn = ["matching name"]
        return matchingNamesReturn!
    }
}
