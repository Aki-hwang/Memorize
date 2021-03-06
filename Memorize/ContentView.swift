//
//  ContentView.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//

import SwiftUI

struct ContentView: View {
//    var emojis : Array<String> = ["โ๏ธ","๐","๐ ","๐บ","๐" ]
//    var emojis : [String] = ["โ๏ธ","๐","๐ ","๐บ","๐" ]
//    var emojis = ["โ๏ธ","๐","๐ ","๐บ","๐","๐ต","๐","๐","๐","๐","๐","๐","๐ป","๐","๐ธ","๐","๐ถ","โต๏ธ","๐ข","โด","๐ค","๐ฅ","๐","๐"]
    @ObservedObject var viewModel: EmojiMemoryGame
    //๋ฌด์ธ๊ฐ ๋ณํ๋ฉด viewModel์ ๋ค์ ๊ทธ๋ ค๋ผ
    @State var emojiCount : Int = 24
    var body: some View {
//        VStack { // Hstack์ ๊ธฐ๋ณธ์ ์ผ๋ก ๋ทฐ์ ๋ชจ๋  ๊ณต๊ฐ์ ์ฐ๊ณ 
            ScrollView{
            //VGrid๋ ๊ฐ๋ก๋ฐฉํฅ์ผ๋ก๋ ์ปฌ๋ผ์ ๋ฐ๋ผ ๊ท ๋ฑํ๊ฒ, ์ธ๋ก ๋ฐฉํฅ์ ๋ชจ๋  ๋ฐฐ์ด์ ๋ฃ์ ์ ์๋๋ก ์ต์ํ
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]){
                //foreach ์ฌ์ฉ์ ๋ฐฐ์ด์ด ์ด๋ฆ์ ๊ทธ๋ฅ ๋ฃ๊ณ  ID ๋ฃ๊ณ  ์ธ๋ฑ์ค ๊ฐ๋ง ์ ๋ฌํด ์ฃผ๋ฉด ๊ฐ๊ฐ๋ฅ
                //๋ฐฐ์ด์์ ๋ฒ์๋ฅผ ์ค์  ํ ์ ์์ด ์ด๋ ๊ฒ ์ ์ฒด์ค์์ ๋ช๊ฐ๋ง ๋ณด์ฌ์ฃผ๋๊ฒ ๊ฐ๋ฅ
                    ForEach(viewModel.cards){ card in
                        CardView(content:card.content,card:card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    //๋จ์ํ aspectRatio๋ง ์ค์ ํด๋ ์ํ๋ ํฌ๊ธฐ๋ฅผ ๋ง๋ค ์ ์์ด.
                }
              }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
//            Spacer() // ๊ฐ๋ฅํ ๋ชจ๋  ๊ณต๊ฐ์ ์ก์ผ๋ ค๊ณ  ๋ธ๋ ฅํด
//            HStack {
//                add
//                Spacer()
//                remove
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
//        }
    }
    
    //๋ฐ๋ ๋ฐ์์ ์ด๋ฐ์์ผ๋ก ๊ตฌํ์ ํ๋ ๊ฑธ ์ถ์ฒํด
//    var remove: some View{
//        Button{
//            if emojiCount < emojis.count{
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
//    var add: some View{
//        Button{ //์ด๋ชจ์ง๊ฐ 0๋ณด๋ค ์์์ง๋ฉด -๋๋๊น ์ด๊ฑธ ๋ง๊ธฐ ์ํด ์งํ
//            if emojiCount > 1{
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
    
}

struct CardView: View {
    var content : String
    let card: MemoryGame<String>.Card
//    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            //์คํ ์์๋ ๋ณ์๋ฅผ ์ธ์ ์๋ค. ๊ธธ๊ณ  ๋ณต์ฌ๋ ๋ด์ฉ๋ค์ ์์๋ ๋ณ์๋ก ๋ง๋ค์ด์ ๊ธธ์ด๋ฅผ ์ค์ด์. ์ฌ๊ธฐ์๋ ํ์์ด ๋ฌผ๋ก  ์์ง๋ง
            // shape : RoundedRectangle ํ์ง๋ง ์ค์ ๊ฐ ์ถ๋ก ํด์ ๊ฒฐ์ ํด
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) //ํ๋๋ฆฌ๋ฅผ ์์ชฝ์ผ๋ก๋ง ์น ํ๊ฒ ํด์ฃ 
                Text(card.content)
                .font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
//        .onTapGesture {
//            isFaceUp.toggle()
//
//        }
//        .animation(.easeInOut(duration: 0.5))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
