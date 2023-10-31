//
//  NotasSwiftDataApp.swift
//  NotasSwiftData
//
//  Created by Esteban Perez Castillejo on 31/10/23.
//

import SwiftUI
import SwiftData

@main
struct NotasSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewControl())
        }
    }
}
