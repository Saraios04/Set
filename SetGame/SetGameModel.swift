//
//  SetGameModel.swift
//  SetGame
//
//  Created by seemakus on 7/2/24.
//

import Foundation

struct SetGameModel {
    private(set) var deck: [Card] =  [Card]()
    
    private var allCards: [Card] = []
    private var numberOfCards: Int = 12
    var numberOfCardsSelected: Int = 0
    private(set) var score = 0
    
    struct Card: Identifiable {
        let numbers: CardNumber
        let shape  : CardShape
        let shading:CardShade
        let color  : CardColor
        var isMatched : Bool? = false
        let id: Int
        var isSelected : Bool? = false
    }
    
    init() {
        var i: Int = 1
        for number in CardNumber.allCases {
            for shape in CardShape.allCases{
                for shade in CardShade.allCases{
                    for color in CardColor.allCases{
                        allCards.append(Card(numbers: number, shape: shape, shading: shade , color: color, id: i))
                        i=i+1
                    }
                }
            }
        }
        allCards.shuffle()
        deck = Array(allCards.prefix(upTo: numberOfCards))
        allCards.removeFirst(numberOfCards)
    }
    
   
    
    var selectedCards: [Card]{
        deck.filter {$0.isSelected ?? false}
    }
    
    
    mutating func checkIfMatch(card1: Card,card2: Card, card3: Card) -> Bool {
        let isNumberValid = Set([card1.numbers, card2.numbers,card3.numbers]).count == 3
        let isShadeValid = Set([card1.shading,card2.shading,card3.shading]).count == 3
        let isColorValid = Set([card1.color,card2.color,card3.color]).count == 3
        let isShapeValid = Set([card1.shape,card2.shape,card3.shape]).count == 3
        let isMatch =  isNumberValid || isShadeValid || isColorValid || isShapeValid
        score = isMatch ? score+3 : score-3
        return isMatch
    }
    
    mutating func removeCards(count:Int){
        deck.removeFirst(count)
    }
    
    mutating func addThreeMoreCards() {
        let newCards = allCards[0..<3]
        deck.append(contentsOf: newCards)
        allCards.removeFirst(3)
    }
    
    mutating func chooseCard(card: Card){
        if let index = deck.firstIndex(where: {$0.id == card.id}){
            deck[index].isSelected?.toggle()
            if selectedCards.threeCardsSelected {
                let match = checkIfMatch(card1: selectedCards[0], card2:  selectedCards[1], card3: selectedCards[2])
                if match {
                    selectedCards.forEach { card in
                        if let index = deck.firstIndex(where: { $0.id == card.id}){
                            deck[index].isMatched = true
                          
                        }
                        
                    }
                    deck.removeAll { card in
                        card.isMatched == true
                    }
                    addThreeMoreCards()
                }
                else {
                    selectedCards.forEach { card in
                        if let index = deck.firstIndex(where: { $0.id == card.id}){
                            deck[index].isSelected?.toggle()
                        }
                    }
                }
            }
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
extension Array {
    var threeCardsSelected : Bool {
        count == 3 ? true : false
    }
}
