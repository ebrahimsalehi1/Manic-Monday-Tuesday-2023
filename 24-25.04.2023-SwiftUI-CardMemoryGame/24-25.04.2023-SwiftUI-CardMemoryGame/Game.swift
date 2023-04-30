//
//  Game.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import SwiftUI

struct Game: View {
    @Binding var typeImage: String

    @State var cardsInfo: Array<CardStruct> = []
    @State var lastFlipped:LastFlippedStruct = LastFlippedStruct(previous: -1, current: -1)
    @State var isLocked: Bool = false
    
    func onClick(info:CardStruct){
        
        if isLocked{
            return
        }
        
        var foundIndex = -1
        for (index,card) in cardsInfo.enumerated(){
            if card.id==info.id {
                cardsInfo[index].isFlipped.toggle()
                foundIndex = index
            }
        }
        
        lastFlipped = LastFlippedStruct(previous: lastFlipped.current, current: foundIndex)
        
        if lastFlipped.previous != -1{
                        
            if cardsInfo[lastFlipped.previous].order == cardsInfo[lastFlipped.current].order {
                lastFlipped = LastFlippedStruct(previous: -1, current: -1)
                return
            }
            
            isLocked = true
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                
                cardsInfo[lastFlipped.previous].isFlipped.toggle()
                cardsInfo[lastFlipped.current].isFlipped.toggle()

                lastFlipped = LastFlippedStruct(previous: -1, current: -1)
                                    
                isLocked = false
            })
            

        }
        
    }
    var body: some View {
            
        VStack{
            
            HStack{
                if cardsInfo.count > 0 {
                    ForEach(0..<4){ i in
                        Card(info:cardsInfo[i],onClick: onClick)
                        
                    }
                }

            }
            
            HStack{
                
                if cardsInfo.count > 0 {
                    ForEach(4..<8){ i in
                        Card(info:cardsInfo[i],onClick: onClick)
                    }
                }
            
            }
            
            HStack{
                
                if cardsInfo.count > 0{
                    ForEach(8..<12){ i in
                        Card(info:cardsInfo[i],onClick: onClick)
                    }
                }

            }
        }
        .onAppear(perform: {
                cardsInfo = makeRandomCards(typeImage:self.typeImage)
               })
        
    }

}

//struct Game_Previews: PreviewProvider {
//    static var previews: some View {
//        Game(typeImage: typeImage)
//    }
//}
