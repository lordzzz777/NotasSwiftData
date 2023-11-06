//
//  EditView.swift
//  NotasSwiftData
//
//  Created by Lordzzz on 1/11/23.
//

import SwiftUI
import SwiftData

struct EditView: View {
    
    @Bindable var isNotas = PersitenciaModel()
    
    @Environment (ViewControl.self) var viewControl
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Form{
            TextField("Titulo de nota", text: $isNotas.titulo)
            TextEditor(text: $isNotas.Texto)
            Button(action: {
                viewControl.editNotas(titulo: isNotas.titulo, texto: isNotas.Texto)
                dismiss()
            }, label: {
                Text("Guardar")
            })
        }
    }
}
