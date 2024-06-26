//
//  Trie.swift
//  SearchFeature
//
//  Created by Lori Montenegro on 19/06/24.
//

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

/// It is the optimal structure for prefix search, but it follows lexicographical order
/// rather than the data entry order. So if the list must be presented in the same order
/// of the source data, this approach requires sorting, which increases time complexity significanlty.
public final class Trie: SearchDataStructure {
    
    // MARK: - Initialization
    
    private(set) var root: TrieNode
    private var orderedWords: [String] = []
    
    private init() {
        self.root = TrieNode()
    }
    
    // MARK: - SearchDataStructure conformance
    
    static func create() -> Trie {
        .init()
    }
    
    func insert(_ words: [String]) {
        words.forEach { word in
            insert(word)
        }
    }
    
    func insert(_ word: String) {
        var currentNode = root
        for character in word {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                let newNode = TrieNode()
                currentNode.children[character] = newNode
                currentNode = newNode
            }
        }
        currentNode.isEndOfWord = true
        orderedWords.append(word)
    }
    
    func matchingNames(with prefix: String) -> [String] {
        var currentNode = root
        
        // Go to end of prefix
        for character in prefix {
            guard let nextNode = currentNode.children[character] else {
                return []
            }
            currentNode = nextNode
        }
        
        // Find every name that passes through the current node
        var words = [String]()
        var prefixArray = Array(prefix)
        findMatchingNames(with: &prefixArray, from: currentNode, words: &words)
        
        return orderedWords.filter { words.contains($0) }
    }
    
    // MARK: - Helper functions
    
    private func findMatchingNames(with string: inout [Character], from node: TrieNode, words: inout [String]) {
        if node.isEndOfWord {
            words.append(String(string))
        }
        
        for (character, childNode) in node.children {
            string.append(character)
            findMatchingNames(with: &string, from: childNode, words: &words)
            string.removeLast()
        }
    }
    
}
