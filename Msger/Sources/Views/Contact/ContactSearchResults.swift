//
//  ContactSearchResults.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore

struct ContactSearchResults: View {

    @Binding var searchText: String
    private let store: ContactStoreProtocol

    init(_ store: @autoclosure @escaping () -> ContactStoreProtocol, searchText: Binding<String>) {
        self.store = store()
        self._searchText = searchText
    }
    var body: some View {
        if searchText.isWhitespace {
            if store.sections.isEmpty {
                ContentUnavailableView("Refresh to load contacts", systemImage: "bird.fill")
            } else {
                ForEach(store.sections, id: \.letter) { section in
                    ContactSection(store, section: section)
                }
            }
        } else {
            let filtered = store.contacts.filter {
                $0.name.contains(searchText, caseSensitive: false)
            }
            if filtered.isEmpty {
                ContentUnavailableView.search
            } else {
                ForEach(filtered, id: \.id) {
                    ContactRow(contact: $0)
                }
            }
        }
    }
}
