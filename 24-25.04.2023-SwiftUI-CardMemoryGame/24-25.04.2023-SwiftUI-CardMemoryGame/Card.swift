//
//  Card.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import SwiftUI

struct Card: View {
    
    var info: CardStruct
    var onClick: (_ info:CardStruct)->Void
    
    var body: some View {
        Button{
            onClick(info)
        } label: {
            Image(info.isFlipped ? info.image : "imgBack").resizable().scaledToFit()
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(info:CardStruct(id:1,name:"name 1",image:"animal-img2",order:1,isFlipped:true)) { info in
            
        }
    }
}
