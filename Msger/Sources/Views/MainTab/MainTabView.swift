//
//  MainTabView.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import SwiftData

struct MainTabView: View {

    @Environment(Router.self) private var router

    var body: some View {
        TabView(selection: .init(get: {
            router.currentTab
        }, set: { router.currentTab = $0 })) {
            ForEach(TabRoute.allCases) { tab in
                MainNavView {
                    switch tab {
                    case .inbox:
                        Text("Inbox")
                    case .contact:
                        ContactMainView()
                    case .account:
                        Text("Account")
                    }
                }
                .equatable(by: tab.id)
                .tabItem {
                    label(for: tab)
                }
                .tag(tab.id)
            }
        }
        .equatable(by: router.currentTab.id)
    }

    @ViewBuilder
    private
    func label(for tab: TabRoute) -> some View {
        switch tab {
        case .inbox:
            Label("Birds", systemImage: "bird")
        case .contact:
            Label("Plants", systemImage: "leaf")
        case .account:
            Label("Account", systemImage: "person.crop.circle")
        }
    }
}

