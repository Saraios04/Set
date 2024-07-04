//
//  SetGameModel.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//

import Foundation

struct SetGameModel {
    private(set) var deck: [Card] =  [Card]()
    
    struct Card {
        let numbers: CardNumber
        let shape  : CardShape
        let shading:CardShade
        let color  : CardColor
        var isMatched = false

    }
    
    init() {
        for number in CardNumber.allCases {
            for shape in CardShape.allCases{
                for shade in CardShade.allCases{
                    for color in CardColor.allCases{
                        deck.append(Card(numbers: number, shape: shape, shading: shade , color: color))
                    }
                }
            }
        }
    }
    
    var numberOfCardsSelected: Int = 0
    var score = 0
    
    mutating func checkIfMatch(card1: Card,card2: Card, card3: Card) -> Bool {
        let isNumberValid = Set([card1.numbers, card2.numbers,card3.numbers]).count == 3
        let isShadeValid = Set([card1.shading,card2.shading,card3.shading]).count == 3
        let isColorValid = Set([card1.color,card2.color,card3.color]).count == 3
        let isShapeValid = Set([card1.shape,card2.shape,card3.shape]).count == 3
        let isMatch =  isNumberValid && isShadeValid && isColorValid && isShapeValid
        score = isMatch ? score+3 : score-3
        return isMatch
    }
    
}
