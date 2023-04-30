//
//  Game.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import SwiftUI

struct Game: View {
    @State var cardsInfo: Array<CardStruct> = makeRandomCards(typeImage:"animal")
    
    func onClick(info:CardStruct){
        for (index,card) in cardsInfo.enumerated(){
            if card.id==info.id {
                cardsInfo[index].isFlipped.toggle()
            }
        }
        print(info)
    }
    var body: some View {
            
        VStack{
            
            Button("Change"){
                print("Change Something ...")
                cardsInfo[0].image = (cardsInfo[0].image=="general-img1" ? "animal-img1":"general-img1")
            }
            
            HStack{
                Card(info:cardsInfo[0],onClick: onClick)
                
                Card(info:cardsInfo[1],onClick: onClick)
                
                Card(info:cardsInfo[2],onClick: onClick)
                
                Card(info:cardsInfo[3],onClick: onClick)
            }
            
            HStack{
                Card(info:cardsInfo[4],onClick: onClick)
                
                Card(info:cardsInfo[5],onClick: onClick)
                
                Card(info:cardsInfo[6],onClick: onClick)
                
                Card(info:cardsInfo[7],onClick: onClick)
            }
            
            HStack{
                Card(info:cardsInfo[8],onClick: onClick)
                
                Card(info:cardsInfo[9],onClick: onClick)
                
                Card(info:cardsInfo[10],onClick: onClick)
                
                Card(info:cardsInfo[11],onClick: onClick)
            }
        }
        
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
