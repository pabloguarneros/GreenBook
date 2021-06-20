//
//  GreenBookApp.swift
//  GreenBook
//
//  Created by Pablo Guarneros on 6/19/21.
//

import SwiftUI

@main
struct GreenBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
