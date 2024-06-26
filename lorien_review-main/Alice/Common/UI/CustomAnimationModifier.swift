//
//  CustomAnimationModifier.swift
//  Common
//
//  Created by Lori Montenegro on 20/06/24.
//

import Foundation
import SwiftUI

struct CustomAnimationModifier: ViewModifier {
    
    @Binding var isAdded: Bool

    func body(content: Content) -> some View {
        content
            .offset(y: isAdded ? 0 : -50)
            .animation(.easeInOut(duration: 1), value: isAdded)
            .onAppear {
                withAnimation {
                    self.isAdded = true
                }
            }
            .onDisappear {
                withAnimation {
                    self.isAdded = false
                }
            }
    }
}
