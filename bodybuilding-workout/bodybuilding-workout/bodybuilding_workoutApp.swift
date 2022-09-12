//
//  bodybuilding_workoutApp.swift
//  bodybuilding-workout
//
//  Created by Moyses Miranda do Vale Azevedo on 12/09/22.
//

import SwiftUI

@main
struct bodybuilding_workoutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
