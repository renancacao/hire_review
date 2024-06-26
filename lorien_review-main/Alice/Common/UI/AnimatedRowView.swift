//
//  AnimatedRowView.swift
//  Common
//
//  Created by Lori Montenegro on 20/06/24.
//

import SwiftUI

public struct AnimatedRowView: View {
    let text: String
    @State private var isAdded: Bool = false

    public var body: some View {
        Text(text)
            .foregroundStyle(Color.darkGray)
            .customAnimation(isAdded: $isAdded)
    }
    
    public init(text: String) {
        self.text = text
    }
}
