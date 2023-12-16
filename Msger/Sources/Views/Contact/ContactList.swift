//
//  ContactList.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore

struct ContactList: View {

    private let store: ContactStoreProtocol
    @State private var searchText = ""

    init(_ store: @autoclosure @escaping () -> ContactStoreProtocol) {
        self.store = store()
    }


    var body: some View {
        List {
            ContactSearchResults(store, searchText: $searchText)
        }
        .searchable(text: $searchText)
        .searchSuggestions {
            if searchText.isEmpty {
                ContactSearchSuggestions(contacts: store.contacts)
            }
        }
        .refreshable {
            store.fetchData()
        }
    }
}
