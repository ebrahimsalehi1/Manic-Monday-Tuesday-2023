//
//  APIs.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 09.06.23.
//

import Foundation

let APP_BACKEND_ENDPOINT="http://localhost:8080/api"

func getVehicleProjects(sort:String,order:String,q:String,search:String) async throws -> [VehicleProjectStruct]{
    
    let queryString = makeQueryString(sort: sort, order: order, search: search)
    guard let url = URL(string: APP_BACKEND_ENDPOINT+"/vehicleprojects"+queryString) else {
        print("Invlid URL")
        return []
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    let cards = try decoder.decode([VehicleProjectStruct].self, from: data)
    
    return cards
}

