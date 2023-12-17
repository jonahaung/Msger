//
//  ContactList.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore

struct ContactList: View {

    private var store: ContactStoreProtocol
    @Environment(\.editMode) private var editMode
    @State private var searchText = ""
    @State private var multiSelection = Set<Contact>()

    init(_ store: @autoclosure @escaping () -> ContactStoreProtocol) {
        self.store = store()
        self.store.fetchData()
    }

    var body: some View {
        let canEdit = editMode?.wrappedValue != .inactive
        let id = store.contacts.count + searchText.count
        VStack {
            List(selection: canEdit ? $multiSelection : nil) {
                ContactSearchResults(store, searchText: $searchText)
            }
            if canEdit {
                HStack {
                    Text(multiSelection.count.description)
                }
            }
        }
        .animation(.bouncy, value: id)
        .refreshable {
            store.fetchData()
        }
        .searchable(text: $searchText)
        .scrollDismissesKeyboard(.interactively)
        .searchSuggestions {
            if searchText.isEmpty {
                ContactSearchSuggestions(contacts: store.contacts)
            }
        }
        .equatable(by: id)
    }
}
