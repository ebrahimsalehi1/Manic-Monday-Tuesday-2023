//
//  sampleData.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import Foundation


var sampleVehicleProjects = [
    VehicleProjectStruct(
                         created: "2023-06-02T13:17:12Z",
                         modified: "2023-06-02T14:40:35Z",
                         productId: "",
                         name: "Sample1 VW245/2CS",
                         description: "B 003",
                         status: "ACTIVE",
                         version: 2,
                         modifiedBy: "TESTUSERID",
                         ETag: "1b1fa87bde6b83521ae11ee3a8b88b392a438117cbe4f929fc4a9270a718d535",
                         brand:BrandStruct(shortName: "VW", longName: ""),
                         kbk:KBKStruct(zsmId: "", label: "MLB00AABA0ACNXX"),
                         kpbs:[KPBStruct(zsmId: "1000001487", label: "BG245/2CS_HALS2")]
                         ),
    VehicleProjectStruct(
                         created: "2023-06-02T13:33:24Z",
                         modified: "2023-06-02T13:33:24Z",
                         productId: "",
                         name: "Sample2 VW33X/XXX",
                         description: "Caddy, E-Caddy, TEST_FINAL",
                         status: "ACTIVE",
                         version: 2,
                         modifiedBy: "TESTUSERID",
                         ETag: "1186a6ee2e51933c541735d4d8e10c6648849e109190fb223c583093055d86ee",
                         brand:BrandStruct(shortName: "VW", longName: ""),
                         kbk:KBKStruct(zsmId: "1000001471", label: "MQB38_XXXXS__XX"),
                         kpbs:[
                            KPBStruct(zsmId: "1000000402", label: "VN33S/0EU_K"),
                            KPBStruct(zsmId: "1000000406", label: "VN33S/0EU_B"),
                            KPBStruct(zsmId: "1000001483", label: "LB333/4CX_HH"),
                        ]
                         ),
    
]
