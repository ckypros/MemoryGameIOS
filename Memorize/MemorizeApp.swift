//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Charles Kypros on 10/15/21.
//

import SwiftUI

@main
struct MemorizeGame: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
