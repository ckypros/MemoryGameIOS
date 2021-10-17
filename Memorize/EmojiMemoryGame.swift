//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Charles Kypros on 10/16/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
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
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
 
