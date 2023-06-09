//
//  makeQueyString.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import Foundation

func makeQueryString(sort:String,order:String,search:String) -> String{
    let sortPrefix = order == "Ascending" ? "+" : "-"
    var sortedValue = ""
    switch(sort){
        case "Project abbreviation":
            sortedValue = "name"
        case "Creation Date":
            sortedValue = "created"
        case "Modification Date":
            sortedValue = "modified"
    default:
        sortedValue = "name"
    }
    return "?sort=\(sortPrefix)\(sortedValue)&search=\(search)"
}
