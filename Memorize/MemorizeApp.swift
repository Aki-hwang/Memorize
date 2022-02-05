//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
