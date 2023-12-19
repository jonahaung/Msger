//
//  MainNavView.swift
//  Msger
//
//  Created by Aung Ko Min on 18/12/23.
//

import SwiftUI

struct MainNavView<Content: View>: View {

    @State private var router: NavRouter
    private let content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        _router = .init(initialValue: .init([]))
    }
    var body: some View {
        NavigationStack(path: $router.routes) {
            content
                .environment(router)
                .navigationDestination(for: Contact.self) {
                    Text($0.id)
                        .navigationTitle($0.name)
                }
        }

    }
}
