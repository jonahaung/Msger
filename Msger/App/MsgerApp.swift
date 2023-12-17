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
    @State private var router = Router()

    var body: some Scene {
        WindowGroup {
            switch router.route {
            case .splashScreen:
                Text("Splash Screen")
                    ._onAppear(after: 1) {
                        self.router.route = .welcom
                    }
            case .welcom:
                Text("Welcome")
                    ._onAppear(after: 1) {
                        self.router.route = .main(.login)
                    }
            case .main(let mainRoute):
                switch mainRoute {
                case .login:
                    Text("Login")
                        ._onAppear(after: 1) {
                            self.router.route = .main(.tab(.contact([])))
                        }
                case .tab(let tabRoute):
                    ContactListNavigationStack(MockContactStore(Account.current, sharedModelContainer.mainContext))
                }
            }
        }
    }
}
