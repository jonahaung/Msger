//
//  ContactList.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore
import XUI

struct ContactList: View {
    
    @Environment(MockContactStore.self) private var store
    @Environment(NavRouter.self) private var navRouter
    @Environment(\.modelContext) private var context
    @Environment(\.editMode) private var editMode

    @State private var searchText = ""
    @State private var multiSelection = Set<Contact>()

    var body: some View {
        List {
            ContactSearchResults($searchText)
        }
        .refreshable {
            store.fetch(context)
        }
        .searchable(text: $searchText)
        .searchSuggestions {
            if searchText.isEmpty {
                ContactSearchSuggestions(contacts: store.contacts)
            }
        }
        .onChange(of: multiSelection) { oldValue, newValue in
            if editMode?.wrappedValue == .inactive {
                if let first = newValue.first {
                    navRouter.push(first)
                }
            }
        }
    }
}
