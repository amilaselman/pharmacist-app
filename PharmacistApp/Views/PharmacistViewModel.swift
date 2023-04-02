//
//  PharmacistViewModel.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import Foundation

class PharmacistViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var medicaments: [Medication] = []
    var allMedicaments = [Medication]()
    
   
    private let categoriesManager: CategoryManager
    private let medicamentsManager: MedicationManager
    
    init(categoriesManager: CategoryManager = CategoryManager(),
         medicamentsManager: MedicationManager = MedicationManager()) {
        self.categoriesManager = categoriesManager
        self.medicamentsManager = medicamentsManager
        getCategories()
        getMedicaments()
    }
    
    private func getCategories() {
        categoriesManager.fetchData { categories in
            self.categories = categories
        }
    }
    
    private func getMedicaments() {
        medicamentsManager.fetchData{ medicaments in
            self.medicaments = medicaments
            self.allMedicaments = medicaments
        }
    }
    
    func getCategoryByID(categoryID: Int) -> Category? {
        categories.first(where: {$0.id == categoryID})
    }
    func getMedicamentByID(medicamentID: Int) -> Medication? {
        medicaments.first(where: {$0.categoryId == medicamentID})
    }
    func getCategoryByMark(categoryMark: String) -> Category? {
        categories.first(where: {$0.mark == categoryMark})
    }
    func getMedicamentByCategory(medicamentCategory: String) -> Medication? {
        medicaments.first(where: {$0.atc == medicamentCategory})
    }
    func searchByCategory(id: Int) {
        // contains() or starts(with:)
        if id == 0 {
            medicaments = allMedicaments
        } else {
            medicaments = medicaments.filter({$0.categoryId == id})
        }
    }
    func searchByName(medicationName: String)  {
        if medicationName.isEmpty {
            medicaments = allMedicaments
        } else {
            medicaments = medicaments.filter({$0.name.contains(medicationName)})
        }
    }
}
