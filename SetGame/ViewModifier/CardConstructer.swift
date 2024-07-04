//
//  StripedView.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//
import SwiftUI

struct CardConstructer: ViewModifier {
    let numberOfShapes: Int
    func body(content: Content) -> some View {
        VStack(spacing: 20) {
            ForEach(0..<numberOfShapes, id: \.self) { _ in
                content
            }
        }
    }
}

extension View {
    func cardConstructer(numberOfShapes: Int) -> some View {
        modifier(CardConstructer(numberOfShapes: numberOfShapes))
    }
}
