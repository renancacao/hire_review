//
//  SearchView.swift
//  Alice
//
//  Created by Lori Montenegro on 18/06/24.
//

import SwiftUI
import SwiftData
import LocalData
import Common

public struct SearchView: View {
        
    @StateObject private var viewModel: SearchViewModel = .init()

    public var body: some View {
        VStack {
            Spacer()
            
            CustomTextField(textInput: $viewModel.textFieldInput)

            List {
                ForEach(viewModel.names, id: \.self) { name in
                    AnimatedRowView(text: name)
                }
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    public init() { }

}

#Preview {
    SearchView()
}
