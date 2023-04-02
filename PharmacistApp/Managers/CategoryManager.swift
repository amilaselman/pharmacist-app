//
//  CategoryManager.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import Foundation
import SwiftUI

class CategoryManager {
    let categoriesURL = "https://api.farmaceut.ba/test/categories"
    func fetchData(completion: @escaping ([Category]) -> () ) {
        guard let url = URL(string: categoriesURL) else { fatalError("URL NOT FOUND")}
        //umjesto dataTask, mozda dodati extension na urlSession?
        URLSession.shared.dataTask(with: url) { data, _, error in
            let categories = try! JSONDecoder().decode([Category].self, from: data!)
           // print(categories)
                       DispatchQueue.main.async {
                completion(categories)
            }
        }
        .resume()
    }
}
