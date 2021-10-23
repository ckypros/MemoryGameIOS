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
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
        
    }
}

    
//    var vehicleThemeButton: some View {
//        Button {
//            //emojis = vehicleEmojis.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "car.2.fill")
//                Text("Vehicles").font(.body)
//            }
//        }
//    }
//
//    var objectThemeButton: some View {
//        Button {
//            //emojis = objectEmojis.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "laptopcomputer.and.iphone")
//                Text("Objects").font(.body)
//            }
//        }
//    }
//
//    var animalThemeButton: some View {
//        Button {
////            emojis = animalEmojis.shuffled()
//        } label : {
//            VStack {
//                Image(systemName: "tortoise.fill")
//                Text("Animals").font(.body)
//            }
//        }
//    }


struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))  // animate on match
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.iconScale)
    }
    
    private struct DrawingConstants {
        static let iconScale: CGFloat = 0.75
        static let fontSize: CGFloat = 32
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}
