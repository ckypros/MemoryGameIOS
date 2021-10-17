//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Charles Kypros on 10/16/21.
//

import SwiftUI



class EmojiMemoryGame {
    static let vehicleEmojis = [
        "🛺", "🚛", "✈️", "🚁", "🚲", "🚜", "🚎", "🏎", "🚓", "🚑", "🚃", "🚂",
        "🚒", "🚐", "🛻", "🚚", "🛴", "🛵", "🏍", "🚤", "⛵️", "🚀", "🛳", "🛸"
    ]
    static let objectEmojis = [
        "⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🕹", "🖲", "💾", "💿", "📷", "🎥",
        "📟", "📺", "📠", "🎛", "🔋", "📡", "🔌", "💡", "⏰", "🔦", "🎙", "☎️"
    ]
    static let animalEmojis = [
        "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁",
        "🐮", "🐷", "🐸", "🐵", "🐥", "🦆", "🦇", "🪰", "🐞", "🐜", "🐝", "🦅"
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            vehicleEmojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
 
