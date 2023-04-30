//
//  makeRandomCards.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import Foundation


func makeRandomCards(typeImage: String)-> Array<CardStruct>{
    
    print(typeImage)
    
    var cardsInfo: Array<CardStruct> = []
    var i = 0
    var count = 0
    while true{
        let randomNumber = Int.random(in: 1..<7)
        
        count = 0
        for card in cardsInfo{
            if card.order==randomNumber{
                count += 1
            }
        }
        
        if count>1 {
            continue
        }
        
        cardsInfo.append(CardStruct(id:i,name:"name \(i)",image:"\(typeImage)-img\(randomNumber)",order:randomNumber,isFlipped:false))
        i += 1
        
        if i==12{
            break
        }
    }
    
    return cardsInfo
}
