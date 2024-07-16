//
//  ContentView.swift
//  SetGame
//
//  Created by seemakus on 6/27/24.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var setGameVM : SetGameViewModel
    
    var body: some View {
        VStack{
            deck
            Spacer()

            HStack {
                Button("+3 cards") {
                    setGameVM.addThreeMoreCards()
                }.disabled(setGameVM.setModel.deck.isEmpty)
                .buttonBorderShape(.roundedRectangle(radius: 12))
                
                Spacer(minLength: 5)
                
                Text("Score: \(setGameVM.getScore())")
                
                Spacer(minLength: 5)
                
                Button("New Game") {
                    setGameVM.newGame()
                }
                .buttonBorderShape(.roundedRectangle(radius: 12))
            }
            .padding()

        }
    }
    
//    var customDeck : some View {
//      
//        LazyVGrid(columns: [GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0)],spacing: 20){
//            ForEach(setGameVM.setModel.deck){card  in
//                SetCard(card: SetGameModel.Card(numbers: card.numbers, shape: card.shape, shading: card.shading, color: card.color, id: card.id))
//                    .frame(height: 250)
//                    .onTapGesture {
//                        setGameVM.chooseCard(card: card)
//                    }
//            }
//        }
//        
//        
//    }
    
    var deck: some View {
        AspectVGrid(items: setGameVM.setModel.deck, aspectRatio: 3/5, minWidth: 35) {  card in
            SetCard(card: card)
                .onTapGesture {
                    setGameVM.chooseCard(card: card)
                }
            
        }
    }
    
    struct SetCard: View {
        let card : SetGameModel.Card
        
        var body : some View {
            GeometryReader { geometry in
                card.shape.shapeView(size: geometry.size, cardShade: card.shading, cardColor: card.color, cardNumber: card.numbers.rawValue, isMatched: card.isMatched ?? false)
                    .cardify(isSelected: card.isSelected ?? false, isMatched: card.isMatched ?? false)
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .opacity(card.isMatched ?? false ? 0 : 1 )
            }
        }
    }
}



#Preview {
    SetGameView(setGameVM: SetGameViewModel())

}


