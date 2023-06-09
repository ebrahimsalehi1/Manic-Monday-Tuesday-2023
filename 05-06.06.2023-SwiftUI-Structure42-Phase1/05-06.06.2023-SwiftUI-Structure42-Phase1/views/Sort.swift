//
//  Sort.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import SwiftUI

struct SortView: View {
    @State private var isShowingSortModal = false
    @State private var selectedSortOption: String = ""
    @State private var selectedOrderOption: String = ""
    
    var body: some View {
        VStack {
            // Other content
            
            Button(action: {
                isShowingSortModal = true
            }) {
                Text("Sort")
            }
        }
        .sheet(isPresented: $isShowingSortModal, content: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Sort By")
                    .font(.headline)
                
                RadioButtonGroup(
                    items: ["Project abbreviation", "Creation Date", "Modification Date"],
                    selectedOption: $selectedSortOption
                )
                
                Divider()
                
                Text("Order")
                    .font(.headline)
                
                RadioButtonGroup(
                    items: ["Ascending", "Descending"],
                    selectedOption: $selectedOrderOption
                )
                
                Spacer()
            }
            .padding()
        })
    }
}

struct RadioButtonGroup: View {
    let items: [String]
    @Binding var selectedOption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                RadioButton(label: item, isSelected: item == selectedOption) {
                    selectedOption = item
                }
            }
        }
    }
}

struct RadioButton: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .blue : .gray)
                
                Text(label)
                    .font(.body)
            }
        }
    }
}

struct SortModalView: View {
    @Binding var selectedSortOption: String
    @Binding var selectedOrderOption: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sort By")
                .font(.headline)
            
            RadioButtonGroup(
                items: ["Project abbreviation", "Creation Date", "Modification Date"],
                selectedOption: $selectedSortOption
            )
            
            Divider()
            
            Text("Order")
                .font(.headline)
            
            RadioButtonGroup(
                items: ["Ascending", "Descending"],
                selectedOption: $selectedOrderOption
            )
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Sort")
    }
}


struct Sort_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
