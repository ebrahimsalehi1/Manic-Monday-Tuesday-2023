//
//  VehicleProjectData.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import Foundation

struct BrandStruct: Identifiable, Decodable{
    let id = UUID()
    
    let shortName: String
    let longName: String?
}

struct KBKStruct: Identifiable, Decodable{
    let id = UUID()
    
    let zsmId: String
    let label: String
}

struct KPBStruct: Identifiable, Decodable{
    let id = UUID()
    
    let zsmId: String
    let label: String
}

struct VehicleProjectStruct: Identifiable, Decodable {
    let id = UUID()
    
    let created: String
    let modified: String
    let productId: String?
    let name: String
    let description: String
    let status:String
    let version: Int
    let modifiedBy: String
    let ETag: String
    
    let brand: BrandStruct
    let kbk: KBKStruct?
    let kpbs: [KPBStruct]
}

