//
//  MedicationModel.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import Foundation
import SwiftUI

struct Medication: Identifiable, Decodable, Hashable {
    
    var id: Int
    var name: String
    var atc: String
    var shortDescription: String?
    var description: String?
    var categoryId: Int
    var activeSubstanceValue: Int
//    var activeSubstanceMeasurementUnit: String?
    var activeSubstanceSelectedQuantity: Int
//    var activeSubstanceQuantityMeasurementUnit: String?
    var minimumDailyDose: Int
//    var maximumDailyDose: Int
//    var showOnCalculator: Bool
//    var forbiddenInPregnancy: Bool
    
}
