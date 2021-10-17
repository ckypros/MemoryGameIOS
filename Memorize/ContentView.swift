//
//  ContentView.swift
//  Memorize
//
//  Created by Charles Kypros on 10/15/21.
//

import SwiftUI

struct ContentView: View {
//    var vehicleEmojis: [String]
//    var objectEmojis: [String]
//    var animalEmojis: [String]
//    @State var emojis: [String]
//    @State var emojiCount: Int
//
//    init() {
//        vehicleEmojis = [
//            "🛺", "🚛", "✈️", "🚁", "🚲", "🚜", "🚎", "🏎", "🚓", "🚑", "🚃", "🚂",
//            "🚒", "🚐", "🛻", "🚚", "🛴", "🛵", "🏍", "🚤", "⛵️", "🚀", "🛳", "🛸"
//        ]
//        objectEmojis = [
//            "⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🕹", "🖲", "💾", "💿", "📷", "🎥",
//            "📟", "📺", "📠", "🎛", "🔋", "📡", "🔌", "💡", "⏰", "🔦", "🎙", "☎️"
//        ]
//        animalEmojis = [
//            "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁",
//            "🐮", "🐷", "🐸", "🐵", "🐥", "🦆", "🦇", "🪰", "🐞", "🐜", "🐝", "🦅"
//        ]
//        emojis = vehicleEmojis.shuffled()
//        emojiCount = Int.random(in: 0..<24)
//    }
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
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
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
