//
//  Notas.swift
//  NotasSwiftData
//
//  Created by Esteban Perez Castillejo on 31/10/23.
//

import SwiftUI
import SwiftData

struct NotasView: View {
    @State private var show = false
    
    @Environment (ViewControl.self) var viewControl
    @Bindable var db: PersitenciaModel
    var body: some View {
        ZStack{
            Image(systemName: "swiftdata").font(.system(size: 300)).opacity(0.1)
            VStack{
                Text(db.titulo)
                    .font(.custom("Cochin", size: 35)).bold()
                HStack{
                    Text(db.Texto ).padding()
                    Spacer()
                }
                Spacer()
            }
            .sheet(isPresented: $show, content: {
                NavigationStack{
                    EditView(isNotas: db)
                }.presentationDetents([.medium])
            })
            .toolbar{
                ToolbarItem{
                    Button(action: {
                        show.toggle()
                    }, label: {
                        Text("Editar")
                        Image(systemName: "pencil")
                    })
                }
            }
        }
    }
}

