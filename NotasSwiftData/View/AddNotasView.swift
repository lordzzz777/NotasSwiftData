//
//  AddNotasView.swift
//  NotasSwiftData
//
//  Created by Lordzzz on 1/11/23.
//

import SwiftUI

struct AddNotasView: View {
    
    @State private var titulo = ""
    @State private var texto = "" 
    
    @Binding var notas: [PersitenciaModel]
    @Environment (ViewControl.self) var viewControl
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
            Form{
                TextField("Titulo de nota", text: $titulo)
                TextEditor(text: $texto)
                Button(action: {
                    viewControl.addNotas(titulo: titulo, texto: texto)
                    dismiss()
                }, label: {
                    Text("Guardar")
                })
            }
        }
    }
}
