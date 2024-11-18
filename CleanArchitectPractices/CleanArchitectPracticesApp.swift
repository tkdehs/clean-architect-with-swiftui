//
//  CleanArchitectPracticesApp.swift
//  CleanArchitectPractices
//
//  Created by PNX on 11/18/24.
//

import SwiftUI

@main
struct CleanArchitectPracticesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
