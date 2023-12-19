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

    @State private var router = Router()
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
            switch router.route {
            case .splashScreen:
                Text("Splash Screen")
            case .welcom:
                Text("Welcome")
            case .main(let mainRoute):
                switch mainRoute {
                case .login:
                    Text("Login")
                case .tab(let tabRoute):
                    MainTabView()
                        .modelContainer(for: [Contact.self])
                        .environment(router)
                }
            }
        }
    }
}
