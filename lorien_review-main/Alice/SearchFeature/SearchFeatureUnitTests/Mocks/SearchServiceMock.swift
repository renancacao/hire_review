//
//  SearchServiceMock.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 21/06/24.
//

import Foundation

class ServiceMock: SearchServiceProtocol {
    
    var calledFetchNamesCount: Int = 0
    
    func fetchNames() -> [String] {
        calledFetchNamesCount += 1
        return ["name1", "name2"]
    }
}
