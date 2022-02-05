//
//  ContentView.swift
//  Memorize
//
//  Created by Chuljin Hwang on 2022/02/04.
//

import SwiftUI

struct ContentView: View {
//    var emojis : Array<String> = ["✈️","🚔","🚠","🛺","🚑" ]
//    var emojis : [String] = ["✈️","🚔","🚠","🛺","🚑" ]
    var emojis = ["✈️","🚔","🚠","🛺","🚘","🛵","🚂","🚈","🚉","🏎","🚑","🚒","🛻","🚚","🛸","🚁","🛶","⛵️","🚢","⛴","🚤","🛥","🚜","🏍"]
    @State var emojiCount : Int = 24
    var body: some View {
        VStack { // Hstack은 기본적으로 뷰의 모든 공간을 쓰고
            ScrollView{
            //VGrid는 가로방향으로는 컬럼에 따라 균등하게, 세로 방향은 모든 배열을 넣을 수 있도록 최소한
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]){
                //foreach 사용시 배열이 이름을 그냥 넣고 ID 넣고 인덱스 값만 전달해 주면 값가능
                //배열에서 범위를 설정 할수 있어 이렇게 전체중에서 몇개만 보여주는게 가능
                ForEach(emojis[0..<emojiCount], id:\.self, content: { index in
                    CardView(content: index).aspectRatio(2/3, contentMode: .fit)
                    //단순히 aspectRatio만 설정해도 원하는 크기를 만들 수 있어.
                })
              }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
//            Spacer() // 가능한 모든 공간을 잡으려고 노력해
//            HStack {
//                add
//                Spacer()
//                remove
//            }
//            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    
    //바디 밖에서 이런식으로 구현을 하는 걸 추천해
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
//        Button{ //이모지가 0보다 작아지면 -되니까 이걸 막기 위해 진행
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
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            //스택 안에는 변수를 쓸수 있다. 길고 복사된 내용들을 상수나 변수로 만들어서 길이를 줄이자. 여기에는 타입이 물론 있지만
            // shape : RoundedRectangle 하지만 스유가 추론해서 결정해
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3) //테두리를 안쪽으로만 칠하게 해죠
            Text(content)
                .font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
                
        }
//        .animation(.easeInOut(duration: 0.5))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
