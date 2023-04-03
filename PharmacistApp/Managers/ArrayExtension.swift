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


//extension Array where Element: Hashable {
//    func uniqued() -> Array {
//        var buffer = Array()
//        var added = Set<Element>()
//        for elem in self {
//            if !added.contains(elem){
//                buffer.append(elem)
//                added.insert(elem)
//            }
//        }
//        return buffer
//    }
//}
