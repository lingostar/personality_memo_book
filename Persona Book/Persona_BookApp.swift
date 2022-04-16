//
//  Persona_BookApp.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

@main
struct Persona_BookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            MainView()
        }
    }
}
