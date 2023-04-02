//
//  CategoryModel.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import Foundation
import SwiftUI

struct Category: Identifiable, Decodable, Hashable {
    
    var id: Int
    var mark: String
    var name: String
    var color: String
    
}
