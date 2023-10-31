//
//  Custon.swift
//  NotasSwiftData
//
//  Created by Esteban Perez Castillejo on 5/11/23.
//

import SwiftUI

// Cambia y modifica la apariencia de los textos
struct CustomText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Cochin", size: 20)).bold()// Cambia el tamaño y el estilo
           // .foregroundColor(Color.red)
            .padding(.leading, 40)
            .padding(.trailing, 10)
            .padding(14)
            .background(Color.white)
            .cornerRadius(15)
            .accentColor(.red)
    }
}
