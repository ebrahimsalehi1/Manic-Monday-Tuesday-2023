//
//  APIs.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 09.06.23.
//

import Foundation

func getVehicleProjects(url:URL) async throws -> [VehicleProjectStruct]{
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    let cards = try decoder.decode([VehicleProjectStruct].self, from: data)
    
    return cards
}

