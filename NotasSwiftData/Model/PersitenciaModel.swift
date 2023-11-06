//
//  PersitenciaModel.swift
//  NotasSwiftData
//
// Created by Lordzzz on 1/11/23.
//

import Foundation
import SwiftData

@Model
class PersitenciaModel {
    @Attribute(.unique) var id: String
    var orden: Int16
    var titulo: String
    var Texto: String

    init(id: String = UUID().uuidString, orden: Int16 = 0 ,titulo: String =  "", Texto: String = "") {
        self.id = id
        self.orden = orden
        self.titulo = titulo
        self.Texto = Texto
    }
}





