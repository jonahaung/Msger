//
//  MsgerApp.swift
//  Msger
//
//  Created by Aung Ko Min on 15/12/23.
//

import SwiftUI
import SwiftData
import MsgerDataStore

@main
struct MsgerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Contact.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContactListNavigationStack(MockContactStore(Account.current, sharedModelContainer.mainContext))
        }
    }
}
