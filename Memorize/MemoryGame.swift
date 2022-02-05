//
//  MemoryGame.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//
//모델을 구현
import Foundation //기본적인 스위프트를 사용할꺼야 뷰 같은 유아이는 안쓸꺼야
//Equatable를 설정하면 ==를 할수있게 변해 
struct MemoryGame<Cardcontent> where Cardcontent: Equatable{ //제너릭을 위한 타입변수 <>
    //즉 Cardcontent 여기에 스트링이나 이미지 등이 올 수 있으니 제너릭으로 표현해 주는거야
    private(set) var cards:Array<Card> // var cards:[Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
//        card.isFaceUp.toggle()
        //함수의 모든 인수들은 상수라서 불가능해
//        if let chosenIndex = index(of:card){아래와 같이 변경
        if let chosenIndex = cards.firstIndex(where:{$0.id == card.id}), //&&가 let있으면 못써서 컴마로 진행
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle() //닐이 아니면 여기를 수행
        } //let을 사용해서 옵셔널반환을 방어한대
//        var chosenCard = cards[chosenIndex]//변수에 넣으면 바로 복사를 해 구조체니까
        //그래서 직접 변경해야해
        
        print(cards)
        
    }
    func index(of card: Card) -> Int? { //옵셔널로 해서 카드가 없으면 닐 반환nil
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil //bogus!
    }
    init(numberOfPairesOfCards: Int, createCardContent: (Int) -> Cardcontent){
        cards = Array<Card>()
        //add numberOfPairesOfCards X2 card to cards array
        for pairIndex in 0..<numberOfPairesOfCards {
            let content: Cardcontent = createCardContent(pairIndex)
            cards.append(Card(content: content, id : pairIndex*2))
            cards.append(Card(content: content, id : pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content: Cardcontent // 상관없어 쓰고 싶어
        var id: Int
    }
    
}
