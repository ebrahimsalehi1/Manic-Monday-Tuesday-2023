//
//  VehicleProjectCard.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import SwiftUI

let WIDTH = 350
let HEIGHT = 100

struct VehicleProjectCard: View {
    let title: String
    let description: String
    
    var body: some View {

            
        VStack {
            
            Text(title)
                .font(.headline)
                .frame(maxWidth:.infinity,alignment:.leading)
            Text(description)
                .font(.subheadline)
                .frame(maxWidth: .infinity,alignment:.leading)
            
            
        }
        .padding()
        .background(Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x:0,y:HEIGHT))
            path.closeSubpath()
        }.stroke(.blue,lineWidth:6))
        .background(Path { path in
            path.move(to: CGPoint(x: 0, y: HEIGHT))
            path.addLine(to: CGPoint(x:WIDTH,y:HEIGHT))
            path.closeSubpath()
        }.stroke(.gray,lineWidth:2))
        .background(Path { path in
            path.move(to: CGPoint(x: WIDTH, y: 0))
            path.addLine(to: CGPoint(x:WIDTH,y:HEIGHT))
            path.closeSubpath()
        }.stroke(.gray,lineWidth:1))
        .background(Path { path in
            path.move(to: CGPoint(x: WIDTH, y: 0))
            path.addLine(to: CGPoint(x:0,y:0))
            path.closeSubpath()
        }.stroke(.gray,lineWidth:1))
        .padding(.bottom,20)
    }
}


struct VehicleProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        VehicleProjectCard(title:"title 1",description:"description 1")
    }
}
