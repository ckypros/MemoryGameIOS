//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Charles Kypros on 10/16/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let vehicleEmojis = [
        "🛺", "🚛", "✈️", "🚁", "🚲", "🚜", "🚎", "🏎", "🚓", "🚑", "🚃", "🚂",
        "🚒", "🚐", "🛻", "🚚", "🛴", "🛵", "🏍", "🚤", "⛵️", "🚀", "🛳", "🛸"
    ]
    private static let objectEmojis = [
        "⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🕹", "🖲", "💾", "💿", "📷", "🎥",
        "📟", "📺", "📠", "🎛", "🔋", "📡", "🔌", "💡", "⏰", "🔦", "🎙", "☎️"
    ]
    private static let animalEmojis = [
        "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁",
        "🐮", "🐷", "🐸", "🐵", "🐥", "🦆", "🦇", "🪰", "🐞", "🐜", "🐝", "🦅"
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            vehicleEmojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
 
