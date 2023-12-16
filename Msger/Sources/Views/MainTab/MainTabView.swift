//
//  MainTabView.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var selection: MainTab
    @State private var navPath = NavigationPath()

    var body: some View {
        TabView(selection: $selection) {
            ForEach(MainTab.allCases) { tab in
//                tab.destination
//                    .tag(tab)
//                    .tabItem { tab.label }
            }
        }
    }
}
