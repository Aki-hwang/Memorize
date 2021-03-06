//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//

import SwiftUI
//func makeCardContent(index:Int) -> String{
//    return "π"
//}
//ViewModel κ΅¬ν , λͺ¨λΈκ³Ό λ·°κ°μ μ°κ²°μ
//ν΄λμ€μλ λ°λμ varμ κ°μ΄ μμ΄μΌν΄ μ¦ μ΄κΈ°ν λ°λμ νμ
class EmojiMemoryGame: ObservableObject {
    
   static let emojis = ["βοΈ","π","π ","πΊ","π","π΅","π","π","π","π","π","π","π»","π","πΈ","π","πΆ","β΅οΈ","π’","β΄","π€","π₯","π","π"]
    static func createMemoryGate() -> MemoryGame<String>{ //static νλκΉ μλ¬κ° μ μλμ§?
        //static νλκ±°λ κΈλ‘λ²λ‘ νλκ±°λ κ°μκ±°μΌ? μ΄ν΄κ° μκ°!
        //μ΄κΈ°νλ₯Ό μν΄ Staticμ ν΄μ€κ±°λ
        MemoryGame<String>(numberOfPairesOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex]}
    }
    
//    MemoryGame<String>(numberOfPairesOfCards: 4, createCardContent: {(index:Int) -> String in
//        return "π"})
//    MemoryGame<String>(numberOfPairesOfCards: 4) {_ in "π"}
    
   
    
    @Published private var model : MemoryGame<String> = createMemoryGate()
    
    //Cardcontent κ° μ΄λ€ νμμΈμ§ λ¬Όμ΄λ³΄λκ±°μΌ
    //λ·°λͺ¨λΈλ‘ λ€λ₯Έ μ κ·Όμ λ§μμ£Όλ κ²μ΄νΈν€νΌ μ­ν μ μν
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
//Mark: - Intent(s)

