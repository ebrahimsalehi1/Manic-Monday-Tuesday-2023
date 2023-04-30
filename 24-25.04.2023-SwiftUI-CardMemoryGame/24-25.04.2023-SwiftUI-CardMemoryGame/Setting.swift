//
//  Setting.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 29.04.23.
//

import SwiftUI

struct Setting: View {
    @State var typeImage: String
    var body: some View {
        
        VStack{
            
            Text(typeImage).padding(20)
            
            Button("General"){
                typeImage = "General"
            }.padding(20)
            Button("Animals"){
                typeImage = "Animals"
            }.padding(20)
        }

    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting(typeImage:"ssdsd")
    }
}
