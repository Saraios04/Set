//
//  Cardify.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isSelected: Bool
    var isMatched: Bool
    
    private var borderColor: Color {
        if isMatched {
            return .green
        } else if isSelected {
            return .blue
        } else {
            return .black
        }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2.0)
                .foregroundColor(borderColor)
               
            
        }
    }
}

extension View {
    func cardify(isSelected: Bool , isMatched: Bool) -> some View {
        modifier(Cardify(isSelected: isSelected , isMatched: isMatched))
    }
}
