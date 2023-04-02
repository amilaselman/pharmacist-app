//
//  BlueButtonStyle.swift
//  PharmacistApp
//
//  Created by MacBook on 3/28/23.
//

import Foundation
import SwiftUI
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
             .frame(width: 20, height: 30)
             .background(Rectangle().fill(Color.blue).opacity(0.5)).cornerRadius(5)
           
    }
    
}
