//
//  ContentView.swift
//  Memorize
//
//  Created by Charles Kypros on 10/15/21.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis: [String]
    var objectEmojis: [String]
    var animalEmojis: [String]
    @State var emojis: [String]
    @State var emojiCount: Int
    
    init() {
        vehicleEmojis = [
            "🛺", "🚛", "✈️", "🚁", "🚲", "🚜", "🚎", "🏎", "🚓", "🚑", "🚃", "🚂",
            "🚒", "🚐", "🛻", "🚚", "🛴", "🛵", "🏍", "🚤", "⛵️", "🚀", "🛳", "🛸"
        ]
        objectEmojis = [
            "⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🕹", "🖲", "💾", "💿", "📷", "🎥",
            "📟", "📺", "📠", "🎛", "🔋", "📡", "🔌", "💡", "⏰", "🔦", "🎙", "☎️"
        ]
        animalEmojis = [
            "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁",
            "🐮", "🐷", "🐸", "🐵", "🐥", "🦆", "🦇", "🪰", "🐞", "🐜", "🐝", "🦅"
        ]
        emojis = vehicleEmojis.shuffled()
        emojiCount = Int.random(in: 0..<24)
    }
    
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
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var vehicleThemeButton: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "car.2.fill")
                Text("Vehicles").font(.body)
            }
        }
    }
    
    var objectThemeButton: some View {
        Button {
            emojis = objectEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "laptopcomputer.and.iphone")
                Text("Objects").font(.body)
            }
        }
    }
    
    var animalThemeButton: some View {
        Button {
            emojis = animalEmojis.shuffled()
        } label : {
            VStack {
                Image(systemName: "tortoise.fill")
                Text("Animals").font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true;
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp;
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
