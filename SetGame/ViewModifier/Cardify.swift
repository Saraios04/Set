//
//  Cardify.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//

import SwiftUI

struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2.0)
                .foregroundColor(.black)
                .padding()
        }
    }
    
}
extension View {
    func cardify() -> some View {
        modifier(Cardify())
    }
}
