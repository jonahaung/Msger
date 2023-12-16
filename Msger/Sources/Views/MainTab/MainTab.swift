//
//  MainTab.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI

enum MainTab: Codable, Hashable, Identifiable, CaseIterable {
    case backyards, birds, plants, account
    var id: MainTab { self }
}

extension MainTab {
    @ViewBuilder
    var label: some View {
        switch self {
        case .backyards:
            Label("Backyards", systemImage: "circle")
        case .birds:
            Label("Birds", systemImage: "bird")
        case .plants:
            Label("Plants", systemImage: "leaf")
        case .account:
            Label("Account", systemImage: "person.crop.circle")
        }
    }
}
