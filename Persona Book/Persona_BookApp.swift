//
//  Persona_BookApp.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

@main
struct Persona_BookApp: App {
    @StateObject var viewModel = MainVM()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(self.viewModel)
        }
    }
}
