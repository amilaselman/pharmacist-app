//
//  MedicationManager.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import Foundation
import SwiftUI

class MedicationManager {
    let medicationURL = "https://api.farmaceut.ba/test/medicaments"
    func fetchData(completion: @escaping ([Medication]) -> () ) {
        guard let url = URL(string: medicationURL) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let medicaments = try! JSONDecoder().decode([Medication].self, from: data!)
           // print(categories)
            DispatchQueue.main.async {
                completion(medicaments)
            }
            
        }
        .resume()
    }
}
