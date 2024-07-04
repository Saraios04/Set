//
//  ContentView.swift
//  SetGame
//
//  Created by seemakus on 6/27/24.
//

import SwiftUI

struct SetGameView: View {
    
    var body: some View {
        GeometryReader { geometry in
            SetCard(card: SetGameModel.Card(numbers: .three, shape: .rectangle, shading: .solid, color: .red))
        }
        
    }

    struct  SetCard: View {
        let card : SetGameModel.Card
        init(card: SetGameModel.Card) {
            self.card = card
        }
        
        var body : some View {
            GeometryReader { geometry in
                card.shape.shapeView(size: geometry.size, cardShade: card.shading, cardColor: card.color, cardNumber: card.numbers.rawValue)
            }
        }
    }
    
}




#Preview {
    SetGameView()
}

//    func Diamond(size: CGSize, isOpen: Bool, isSolid: Bool, color: Color) -> some View {
//        return DiamondShape()
//            .foregroundColor(isSolid ? color : .clear)
//            .overlay(DiamondShape()
//                .stroke(color, lineWidth : isOpen ? 10 : 0))
//            .frame(width: size.width * (0.5) , height: size.height * (0.25),alignment: .center)
//
//
//
//    }
//    func ovalShape(size: CGSize, isOpen: Bool, isSolid: Bool, color: Color)-> some View {
//        return Capsule(style: .continuous)
//            .foregroundColor(isSolid ? color : .clear)
//            .overlay(Capsule()
//                .strokeBorder(color, lineWidth : isOpen ? 10 : 0))
//            .frame(width: (size.width/(1.5)) ,height: (size.height)/8)
//
//    }
//
//    func rectShape(size: CGSize, isOpen: Bool, isSolid: Bool) -> some View {
//        Rectangle()
//            .foregroundColor(isSolid ? .red : .clear) // Fill color if isSolid is true
//            .overlay(
//                Rectangle()
//                    .strokeBorder(Color.red, lineWidth: isOpen ? 10 : 0)
//            )
//            .frame(width: size.width / 2, height: size.height / 6)
//    }
//
