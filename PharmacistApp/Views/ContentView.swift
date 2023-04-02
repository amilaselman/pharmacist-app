//
//  ContentView.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PharmacistViewModel()
    @State var path = NavigationPath()
    @State var searchText = ""
    @State var pickerSelected = ""
    let setOfATC: Set = ["A02AD", "A02BA", "A01AB09"]
    let setOfMARK: Set = ["A", "C", "B"]
    
    var body: some View {
        NavigationStack(path: $path) {
            categoryNameView
            contentView
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { medicationName in
            viewModel.searchByName(medicationName: medicationName)
        }
    }
    
    func getCategoryIDfromMedicaments() -> [Int] {
        var arrayOfCategoryID = [Int]()
        for item in viewModel.medicaments {
            let categoryID = item.categoryId
            arrayOfCategoryID = [categoryID]
        }
        return arrayOfCategoryID.removeDuplicates()
    }
    
    
    var categoryNameView: some View {
                HStack{
                    ForEach (viewModel.categories, id: \.id) { item in
                        ForEach (1..<14)  { id in
                            if let medicament = viewModel.getMedicamentByID(medicamentID: 1) {
                                Button {
                                    print(item.mark)
                                    viewModel.searchByCategory(id: item.id)
                                } label: {
                                    Text("\(item.mark)")
                                }
                            }
                        }
                    }
                }.lineLimit(10)
        // This is just comment for commit
        // Another line of comment added
        // works with categories
//        HStack{
//            List {
//
//                let itemID = getCategoryIDfromMedicaments()
//                ForEach (viewModel.categories, id: \.id) { item in
//                    if itemID != nil {
//                        Button {
//                            print(item.mark)
//                            print(itemID)
//                            viewModel.searchByCategory(id: item.id)
//                            print(getCategoryIDfromMedicaments())
//                        } label: {
//                            Text("\(item.mark)")
//                        }
//                    }
//                }
//            }.listStyle(.insetGrouped)
//
//        }.lineLimit(10)
        
        
        
        
        //                ScrollView(.horizontal){
        //                    HStack{
        //                        ForEach (viewModel.medicaments, id: \.categoryId) { item in
        //                            Button(item.atc) {
        //                                viewModel.searchByCategory(id: item.categoryId)
        //                            }.buttonStyle(BlueButton())
        //                        }
        //                    }
        //                }
    }//categoryNameView ends here
    
    
    var contentView: some View {
        List (viewModel.medicaments, id: \.id) { item in
            if let category = viewModel.getCategoryByID(categoryID: item.categoryId) {
                let details = Details(categories: category, medicaments: item)
                let cell = Cell(categories: category, medicaments: item)
                NavigationLink {
                    details
                } label: {
                    cell
                }.navigationBarTitle("Registar lijekova").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


