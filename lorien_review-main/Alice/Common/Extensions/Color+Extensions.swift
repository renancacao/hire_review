//
//  Color+Extensions.swift
//  Common
//
//  Created by Lori Montenegro on 20/06/24.
//

import Foundation
import SwiftUI

extension Color {
    static var darkGray: Color {
        .init(red: 110/255, green: 110/255, blue: 110/255)
    }
    
    static var lightPink: Color {
        .init(red: 1.0, green: 0.4, blue: 0.6)
    }
}

#Preview(body: {
    VStack {
        Text("Dark gray")
            .foregroundStyle(Color.darkGray)
        Text("Light pink")
            .foregroundStyle(Color.lightPink)
    }
})
