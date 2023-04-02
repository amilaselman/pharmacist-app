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
        for item in viewModel.categories {
            //let meds = viewModel.getMedicamentByID(medicamentID: item.id)
            arrayOfCategoryID = [item.id]
        }
        return arrayOfCategoryID.removeDuplicates()
    }

    
    
    var categoryNameView: some View {
        //works  just with categories
        HStack{
            let itemId = getCategoryIDfromMedicaments()// [Int]
              ForEach (viewModel.categories, id: \.id) { item in
                if (viewModel.getMedicamentByID(medicamentID: item.id ) != nil) {
                  Button {
                    print(item.mark)
                    viewModel.searchByCategory(id: item.id)
                  } label: {
                    Text("\(item.mark)")
                  }.buttonStyle(BlueButton())
                }
              }
            }
       
        // This is just comment for commit
        // Another line of comment added
        
//        HStack{
//            List {
//                let itemID = getCategoryIDfromMedicaments()
//                ForEach (viewModel.categories, id: \.id) { item in
//                    if itemID != [] {
//                        Button {
//                            print(item.mark)
//                            print(itemID)
//                            viewModel.searchByCategory(id: item.id)
//                            print(getCategoryIDfromMedicaments())
//                        } label: {
//                            Text("\(item.mark)")
//                        }.buttonStyle(BlueButton())
//                    }
//                }
//            }
//        }
        
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


