//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by seemakus on 7/5/24.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published var setModel: SetGameModel = SetGameModel()
   
    
    func newGame() {
        setModel = SetGameModel()
    }
    
    func chooseCard(card: SetGameModel.Card){
        setModel.chooseCard(card: card)

    }
    
    func addThreeMoreCards() {
        setModel.addThreeMoreCards()
    }
    func getScore() -> Int {
        setModel.getScore()
    }
}
    

