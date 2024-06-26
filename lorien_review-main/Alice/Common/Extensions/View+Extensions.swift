//
//  View+Extensions.swift
//  Common
//
//  Created by Lori Montenegro on 20/06/24.
//

import Foundation
import SwiftUI

extension View {
    public func customAnimation(isAdded: Binding<Bool>) -> some View {
        self.modifier(CustomAnimationModifier(isAdded: isAdded))
    }
}
