//
//  Image+Extension.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import SwiftUI

extension Color {
    
    static let background = Color("Background")
    static let searchbar = Image("Search")
    
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
    
}
