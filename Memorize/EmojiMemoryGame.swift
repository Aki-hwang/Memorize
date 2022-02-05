//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//

import SwiftUI
//func makeCardContent(index:Int) -> String{
//    return "😀"
//}
//ViewModel 구현 , 모델과 뷰간의 연결자
//클래스에는 반드시 var에 값이 있어야해 즉 초기화 반드시 필요
class EmojiMemoryGame: ObservableObject {
    
   static let emojis = ["✈️","🚔","🚠","🛺","🚘","🛵","🚂","🚈","🚉","🏎","🚑","🚒","🛻","🚚","🛸","🚁","🛶","⛵️","🚢","⛴","🚤","🛥","🚜","🏍"]
    static func createMemoryGate() -> MemoryGame<String>{ //static 하니까 에러가 왜 안나지?
        //static 하는거랑 글로벌로 하는거랑 같은거야? 이해가 안가!
        //초기화를 위해 Static을 해준거래
        MemoryGame<String>(numberOfPairesOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex]}
    }
    
//    MemoryGame<String>(numberOfPairesOfCards: 4, createCardContent: {(index:Int) -> String in
//        return "😀"})
//    MemoryGame<String>(numberOfPairesOfCards: 4) {_ in "😀"}
    
   
    
    @Published private var model : MemoryGame<String> = createMemoryGate()
    
    //Cardcontent 가 어떤 타입인지 물어보는거야
    //뷰모델로 다른 접근을 막아주는 게이트키퍼 역할을 수행
    var cards:Array<MemoryGame<String>.Card>{
        return model.cards
    }
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
//Mark: - Intent(s)

