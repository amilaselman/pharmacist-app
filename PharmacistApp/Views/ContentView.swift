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
    
    //    func getCategoryIDfromMedicaments() -> [Int] {
    //        var arrayOfIDs = [Int]()
    //        for item in viewModel.medicaments {
    //            let meds = viewModel.getMedicamentByID(medicamentID: item.categoryId)
    //            arrayOfIDs = [item.categoryId]
    //            //return arrayOfIDs.removeDuplicates()
    //        }
    //        return arrayOfIDs.removeDuplicates()
    //    }
    //
    
    var categoryNameView: some View {
        HStack{
            ForEach(viewModel.categories, id: \.id) { item in
                if (!viewModel.isCategoryEmpty(id: item.id)) {
                    Button {
                        print(item.mark)
                        viewModel.searchByCategory(id: item.id)
                    } label: {
                        Text("\(item.mark)")
                    }.buttonStyle(BlueButton())
                }
            }
        }
    }//categoryNameView ends here
    
    
    var contentView: some View {
        List (viewModel.medicamentsFiltered, id: \.id) { item in
            if let category = viewModel.getCategoryByID(categoryID: item.categoryId) {
                let details = Details(categories: category, medicaments: item)
                let cell = Cell(categories: category, medicaments: item)
                NavigationLink {
                    details
                } label: {
                    cell
                }.navigationBarTitle("Medication registry").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


