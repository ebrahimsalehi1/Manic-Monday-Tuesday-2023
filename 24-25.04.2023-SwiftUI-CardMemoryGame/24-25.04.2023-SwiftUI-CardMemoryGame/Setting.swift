//
//  Setting.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import SwiftUI

struct Setting: View {
    @Binding var typeImage: String
    
    var body: some View {
        
        VStack{
            
            Text("You have chosen \(typeImage) category").padding(20)
            
            Button("general"){
                typeImage = "general"
            }.padding(20)
            Button("animal"){
                typeImage = "animal"
            }.padding(20)
        }

    }
}

//struct Setting_Previews: PreviewProvider {
//    static var previews: some View {
//        Setting(typeImage:"general")
//    }
//}
