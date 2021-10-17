//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Charles Kypros on 10/15/21.
//

import SwiftUI

@main
struct MemorizeGame: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
