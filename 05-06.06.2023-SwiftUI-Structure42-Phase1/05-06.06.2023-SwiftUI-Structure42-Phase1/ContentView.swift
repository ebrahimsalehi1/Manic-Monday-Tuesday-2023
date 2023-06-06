//
//  ContentView.swift
//  05-06.06.2023-SwiftUI-Structure42-Phase1
//
//  Created by Oshtorjani, Ebrahim Salehi (EXTERN: VW AG) on 05.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var searchTimer: Timer? = nil
    @State private var isShowingSortModal = false
    @State private var selectedSortOption: String = "Project abbreviation"
    @State private var selectedOrderOption: String = "Ascending"
    
    @State private var cards = sampleVehicleProjects
    
    @State var dataVehicleProjects = [VehicleProjectStruct]()
    @State private var isLoading = false
    @State private var isError = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search in vehicle project", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.blue,lineWidth:1))
                    .padding(.leading,10)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification)) { _ in
                        searchTimer?.invalidate()
                        
                        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false){ _ in
                            performSearch()
                        }
                    }
                
                Button(action:{
                    performSearch()
                }){
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing)
                        .foregroundColor(.blue)
                }
                .padding(.trailing,10)
            }

            Spacer()
            // Buttons such as Filter, Sort, Create
               
            HStack {
                Button(action: {
                    performFilter()
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .padding()
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    performSort()
                }) {
                    Image(systemName: "arrow.up.arrow.down")
                        .padding()
                        .foregroundColor(.blue)
                }
                
                Button(action: {
                    performCreate()
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            .sheet(isPresented: $isShowingSortModal, content: {
                NavigationView {
                    SortModalView(selectedSortOption: $selectedSortOption, selectedOrderOption: $selectedOrderOption)
                        .navigationBarItems(
                            leading: Button(action: {
                                isShowingSortModal = false
                                
                                print("values \(selectedSortOption) \(selectedOrderOption)")
                                Task {
                                    await performFetchData()
                                }
                                    
                            }) {
                                Text("Back")
                                    .fontWeight(.bold)
                            }
                        )
                }
            })
                        
            // Cards
            ScrollView {
                if(isLoading){
                    ProgressView("please wait")
                        .scaleEffect(1)
                }
                else if (isError) {
                    Text("Error: ")
                        .foregroundColor(.red)
                }
                else{
                    LazyVStack(
                        alignment: .leading,
                        spacing: 16,
                        pinnedViews: [.sectionHeaders]
                    ) {
                        ForEach(cards) { card in
                            VehicleProjectCard(title: card.name, description: card.description)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // Set the LazyVStack to occupy full width
                }
            }
            .task {
                await performFetchData()
            }


        }
    }
    
    func performSearch(){
        print("click was successful",searchText)
        Task{
            await performFetchData()
        }
    }
    
    func performFilter(){
        print("perform Filter")
    }
    
    func  performSort(){
        print("perform Sort")
        isShowingSortModal = true
    }
    
    func performCreate(){
        print("perform Create")
    }
    
    func performFetchData() async{
        isLoading = true
        let queryString = makeQueryString(sort: selectedSortOption, order: selectedOrderOption, search: searchText)
        let url = "http://localhost:8080/api/vehicleprojects"+queryString
        print(url)
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
            
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let vehicleProjects = try decoder.decode([VehicleProjectStruct].self, from: data)

            cards = vehicleProjects
            
            print("count cards are \(cards.count)")
        } catch {
            print("Invalid data \(error)")
            dataVehicleProjects = []
            isError = true
            isLoading = false
        }
        
        isLoading = false
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
