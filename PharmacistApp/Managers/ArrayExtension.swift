//
//  ArrayExtension.swift
//  PharmacistApp
//
//  Created by MacBook on 3/31/23.
//

import Foundation


extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
