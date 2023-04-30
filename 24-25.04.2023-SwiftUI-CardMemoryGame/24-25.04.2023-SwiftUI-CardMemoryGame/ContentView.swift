//
//  ContentView.swift
//  24-25.04.2023-SwiftUI-CardMemoryGame
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 28.04.23.
//

import SwiftUI

struct ContentView: View {
    @State var typeImage: String
    
    var body: some View {
        NavigationStack{
            NavigationLink("Game"){
                Game(typeImage:$typeImage)
            }.padding(20)
            
            NavigationLink("Setting"){
                Setting(typeImage:$typeImage)
            }.padding(20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(typeImage:"animal")
    }
}
