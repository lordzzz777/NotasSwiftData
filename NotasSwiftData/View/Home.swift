//
//  Home.swift
//  NotasSwiftData
//
//  Created by Esteban Perez Castillejo on 1/11/23.
//

import SwiftUI

struct Home: View {
    var texto = "Hola"
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    Text("Placeholder")
                        .listRowBackground(Color.clear)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10) // Fondo degradado y esquinas redondeadas
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}


