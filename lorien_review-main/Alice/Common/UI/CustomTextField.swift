//
//  CustomTextField.swift
//  Common
//
//  Created by Lori Montenegro on 20/06/24.
//

import Foundation
import SwiftUI

public struct CustomTextField: View {
    
    @Binding public var textInput: String
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            TextField("", text: $textInput)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .foregroundColor(.darkGray)
                .autocapitalization(.none)
                .background(Color.white)
                .padding(.bottom)
            
            Rectangle()
                .frame(height: 1.6)
                .foregroundColor(.lightPink)
                .padding()
                
        }
        .background(
            Color.white
                .shadow(color: .black.opacity(0.15), radius: 1, x: 0, y: 2)
        )

        
        
    }
    
    public init(textInput: Binding<String>) {
        self._textInput = textInput
    }
}

#Preview {
    CustomTextField(textInput: .constant(""))
}
