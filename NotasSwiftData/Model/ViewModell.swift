//
//  ViiewControl.swift
//  NotasSwiftData
//
//  Created by Lordzzz on 1/11/23.
//

import SwiftUI
import SwiftData

@Observable
class ViewControl: ObservableObject {
    let container = try! ModelContainer(for: PersitenciaModel.self)
    
    @MainActor
    var context: ModelContext{
        container.mainContext
    }
    
   
    var notas: [PersitenciaModel] = []
    
    @MainActor
    func getNota(){
        let fetchDescripttor = FetchDescriptor(predicate: nil, sortBy: [SortDescriptor<PersitenciaModel>(\PersitenciaModel.orden)])
        do{
            notas = try context.fetch(fetchDescripttor)
        }catch let error as NSError{
            print("algono salio mal", error.localizedDescription)
        }
    }
    
    @MainActor
    func move(from source: IndexSet, to destination: Int) {
          var items = notas
          items.move(fromOffsets: source, toOffset: destination)
          for i in 0..<items.count {
              items[i].orden = Int16(i)
          }
          notas = items
      }
    
    @MainActor
    func addNotas(titulo: String, texto: String){
        let newNotas = PersitenciaModel(id: UUID().uuidString, titulo: titulo , Texto: texto)
        context.insert(newNotas)
        do{
            try context.save()
            notas = []
            getNota()
            print("Guardado con exito")
        }catch let error as NSError{
            print("Algo salio mal", error.localizedDescription)
        }
    }
    
    @MainActor
    func editNotas(titulo: String, texto: String){
        _ = PersitenciaModel(titulo: titulo, Texto: texto)
        do{
            try context.save()
            notas = []
            getNota()
            print("Guardado con exito")
        }catch let error as NSError{
            print("Algo salio mal", error.localizedDescription)
        }
    }
    
    @MainActor
    func deleteNotas(){
        notas.forEach{
            context.delete($0)
        }
        
        do{
            try context.save()
            notas = []
            getNota()
            print("Eliminado con exito")
        }catch let error as NSError{
            print("Algo salio mal", error.localizedDescription)
        }
    }
    
}
