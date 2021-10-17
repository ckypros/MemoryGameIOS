//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Charles Kypros on 10/15/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle).bold()
            HStack {
                vehicleThemeButton
                Spacer()
                objectThemeButton
                Spacer()
                animalThemeButton
            }
            .padding([.leading, .bottom, .trailing])
            .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
        
    }
    
    var vehicleThemeButton: some View {
        Button {
            //emojis = vehicleEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "car.2.fill")
                Text("Vehicles").font(.body)
            }
        }
    }
    
    var objectThemeButton: some View {
        Button {
            //emojis = objectEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "laptopcomputer.and.iphone")
                Text("Objects").font(.body)
            }
        }
    }
    
    var animalThemeButton: some View {
        Button {
//            emojis = animalEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "tortoise.fill")
                Text("Animals").font(.body)
            }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
