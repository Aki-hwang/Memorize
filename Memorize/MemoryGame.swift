//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//
//모델을 구현
import Foundation //기본적인 스위프트를 사용할꺼야 뷰 같은 유아이는 안쓸꺼야

struct MemoryGame<Cardcontent>{ //제너릭을 위한 타입변수 <>
    //즉 Cardcontent 여기에 스트링이나 이미지 등이 올 수 있으니 제너릭으로 표현해 주는거야
    private(set) var cards:Array<Card> // var cards:[Card]
    
    func choose(_ card: Card) {
        
    }
    init(numberOfPairesOfCards: Int, createCardContent: (Int) -> Cardcontent){
        cards = Array<Card>()
        //add numberOfPairesOfCards X2 card to cards array
        for pairIndex in 0..<numberOfPairesOfCards {
            let content: Cardcontent = createCardContent(pairIndex)
            cards.append(Card(content: content))
        }
    }
    struct Card{
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content: Cardcontent // 상관없어 쓰고 싶어
    }
    
}
