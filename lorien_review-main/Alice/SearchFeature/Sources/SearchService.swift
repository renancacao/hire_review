//
//  SearchService.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 19/06/24.
//

import Foundation
import SwiftData
import LocalData

protocol SearchServiceProtocol {
    func fetchNames() -> [String]
}

class SearchService: SearchServiceProtocol {
    
    private var providers: [Provider] = []
    private var jsonPath: URL
    
    init(jsonPath: URL? = nil) {
        guard let url = jsonPath ?? Bundle(for: Provider.self).url(forResource: "providers", withExtension: "json") else {
            fatalError("Failed to find providers.json")
        }
        self.jsonPath = url
    }
    
    func fetchNames() -> [String] {
        do {
            let data = try Data(contentsOf: jsonPath)
            providers = try JSONDecoder().decode([Provider].self, from: data)
            return providers.map { $0.name }
        } catch {
            print("Failed to load providers.")
            return []
        }
    }
    
}
