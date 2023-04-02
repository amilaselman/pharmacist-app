//
//  Details.swift
//  PharmacistApp
//
//  Created by MacBook on 3/22/23.
//

import SwiftUI

struct Details: View {
    @State var categories: Category
    @State var medicaments: Medication
    var body: some View {
        VStack {
            topDescription
            Divider()
            middleDescription
            Divider()
            bottomDescription
        }
    }
    
    var topDescription: some View {
        VStack {
            HStack{
                Image("medicationImage")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .leading)
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text(medicaments.name)
                        .font(.title)
                    Text("\(medicaments.atc) - \(categories.name)")
                    
                }
                
            }
            Text(medicaments.shortDescription ?? "")
                .minimumScaleFactor(5.0)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    var middleDescription: some View {
        HStack{
            supstanceInformation(text: "Aktivna supstanca",frameText: medicaments.activeSubstanceValue, backgroundColor: Color(.blue), textColor: Color(.systemBlue))
            supstanceInformation(text: "Omjer aktivne supstance",frameText: medicaments.activeSubstanceSelectedQuantity, backgroundColor: Color(.green), textColor: Color(.systemGreen))
            supstanceInformation(text: "Preporucena dnevna doza", frameText: medicaments.minimumDailyDose,backgroundColor: Color(.yellow), textColor: Color(.systemYellow))
        }.padding(.all)
    }
    
    var bottomDescription: some View {
        ScrollView {
            Text(medicaments.description ?? "")
                .lineLimit(40)
                .minimumScaleFactor(0.5)
        }.padding(.all)
    }
    
    func supstanceInformation(text: String, frameText: Int, backgroundColor: Color, textColor: Color) -> some View {
        VStack {
            Text(text)
                .multilineTextAlignment(.center)
            if frameText == 0 {
                Text("/")
                    .frame(width: 110, height: 50)
                    .background(Rectangle().fill(backgroundColor).opacity(0.2))
                    .cornerRadius(5)
                    .foregroundColor(textColor)
            } else {
                Text("\(frameText)")
                    .frame(width: 110, height: 50)
                    .background(Rectangle().fill(backgroundColor).opacity(0.2))
                    .cornerRadius(5)
                    .foregroundColor(textColor)
            }
        }.frame(alignment: .center)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(categories: Category(id: 2, mark: "B", name: "Krv i krvotvorni organi", color: "#b51a00"),
                medicaments:
                    Medication(id: 31, name: "Farin", atc: "B01AA03", shortDescription: "Lijecenje...", description: "Lijecenje tromboza vena....", categoryId: 2, activeSubstanceValue: 0, activeSubstanceSelectedQuantity: 0 , minimumDailyDose: 0))
    }
}
