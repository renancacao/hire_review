//
//  SearchViewModel.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 19/06/24.
//

import Foundation
import SwiftUI
import LocalData

class SearchViewModel: ObservableObject {
    
    private var service: SearchServiceProtocol
    private var dataStructure: SearchDataStructure
    
    @Published var names: [String] = []
    @Published var textFieldInput: String = "" {
        didSet {
            textFieldDidChange()
        }
    }
    
    init(service: SearchServiceProtocol = SearchService(), dataStructure: SearchDataStructure = Trie.create()) {
        self.service = service
        self.dataStructure = dataStructure
    }
    
    func fetchData() {
        names = service.fetchNames()
        dataStructure.insert(names)
    }
    
    func textFieldDidChange() {
        withAnimation {
            names = dataStructure.matchingNames(with: textFieldInput)
        }
    }
    
}
