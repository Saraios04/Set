//
//  CardProperties.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//

import Foundation
import SwiftUI

enum CardShape: CaseIterable{
        case rectangle
        case oval
        case diamond
    
    func shapeView(size: CGSize,cardShade: CardShade, cardColor: CardColor, cardNumber: Int,isMatched: Bool) ->  some View {
        switch self {
        case .rectangle:
              let frameSize = CGSize(width: size.width / 2, height: size.height / 6)
            return AnyView(Rectangle() .makeSetCard(size: size, cardShade: cardShade, cardColor:cardColor.color, cardNumber: cardNumber,frameSize: frameSize))
        case .oval:
             let frameSize = CGSize(width: (size.width/(1.5)) ,height: (size.height)/8)
            return AnyView(Capsule().makeSetCard(size: size, cardShade: cardShade, cardColor:cardColor.color, cardNumber: cardNumber,frameSize: frameSize))
        case .diamond:
           
            let frameSize = CGSize(width: size.width * (0.25),height: size.height * (0.25))
            return AnyView(DiamondShape().makeSetCard(size: size, cardShade: cardShade, cardColor:cardColor.color, cardNumber: cardNumber,frameSize: frameSize))
        }
    }
}
enum CardShade: CaseIterable{
        case solid
        case open
        case stripes
        
    }
enum CardColor: CaseIterable{
        case red
        case blue
        case yellow
    var color: Color {
        switch self {
        case .red:
                .red
        case .blue:
                .blue
        case .yellow:
                .yellow
        }
    }
    }
enum CardNumber: Int,CaseIterable{
        case one = 1
        case two
        case three
    }

extension Shape {
    func makeSetCard(size: CGSize, cardShade: CardShade, cardColor: Color,cardNumber: Int,frameSize: CGSize) ->  some View  {
        let base = self.frame(width: frameSize.width, height: frameSize.height,alignment: .center)
        switch cardShade {
        case .solid:
            return AnyView(base
                .foregroundColor(cardColor)
                .cardConstructer(numberOfShapes: cardNumber))
                //.cardify(isSelected: false, isMatched: false))
               
           
        case .stripes:
            return AnyView(base.foregroundColor(cardColor).opacity(0.5)
                .cardConstructer(numberOfShapes: cardNumber))
               // .cardify(isSelected: false, isMatched: false))
       
        case .open:
            return AnyView(self.stroke(cardColor,lineWidth: 5)
                .frame(width: size.width / 2, height: size.height / 6)
                .cardConstructer(numberOfShapes: cardNumber))
        }
        
    }
}
