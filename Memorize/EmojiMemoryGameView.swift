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
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20)).padding(5).opacity(0.5)
                    Text(card.content).font(iconFont(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(DrawingConstants.zeroOpacity)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func iconFont(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.iconScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let iconScale: CGFloat = 0.75
        static let zeroOpacity: Double = 0
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
