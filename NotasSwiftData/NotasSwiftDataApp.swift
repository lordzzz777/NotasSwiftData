//
//  NotasSwiftDataApp.swift
//  NotasSwiftData
//
//  Created by Lordzzz on 1/11/23.
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
