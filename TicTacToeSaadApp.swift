//
//  TicTacToeSaadApp.swift
//  TicTacToeSaad
//
//  Created by Saad Adil on 26/10/2022.
//

import SwiftUI

@main
struct TicTacToeSaadApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
