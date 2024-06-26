//
//  SearchDataStructure.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 19/06/24.
//

import Foundation

protocol SearchDataStructure {
    static func create() -> Self
    func insert(_ words: [String])
    func insert(_ word: String)
    func matchingNames(with prefix: String) -> [String]
}
