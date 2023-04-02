//
//  Cell.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import SwiftUI

struct Cell: View {
    @State var categories: Category
    @State var medicaments: Medication
    
    var body: some View {
        HStack {
            medicationColor
            medicationInfo
            Spacer()
        }
        .lineLimit(1)
        .minimumScaleFactor(0.4)
        .padding(.leading)
    }
    
    var medicationColor: some View {
        Rectangle()
            .frame(width: 10, height: 50, alignment: .leading)
            .foregroundColor(Color(hexStringToUIColor(hex: categories.color)))
            }
    var medicationInfo: some View {
        VStack(alignment: .leading){
            Text(medicaments.name)
                .font(.title)
                .multilineTextAlignment(.leading)
            Text("\(medicaments.atc) - \(categories.name)")
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell( categories: Category(id: 2, mark: "B", name: "Krv i krvotvorni organi", color: "#b51a00"),
              medicaments:
                  Medication (id: 31, name: "Farin", atc: "B01AA03", shortDescription: "Lijecenje...", description: "Lijecenje tromboza vena....", categoryId: 2, activeSubstanceValue: 0, activeSubstanceSelectedQuantity: 0 , minimumDailyDose: 0))
    }
}
