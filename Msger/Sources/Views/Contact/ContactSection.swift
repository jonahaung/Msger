//
//  ContactSection.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore
import XUI

struct ContactSection: View {

    private let section: (letter: String, contacts: [MsgerDataStore.AnyContact])
    @Environment(\.modelContext) private var modelContext
    @Environment(MockContactStore.self) private var store

    init(_ section: (letter: String, contacts: [MsgerDataStore.AnyContact])) {
        self.section = section
    }

    var body: some View {
        Section {
            ForEach(section.contacts, id: \.id) {
                ContactRow(contact: $0)
            }
            .onDelete{
                delete(at: $0)
            }
        }
    }
    private func delete(at indexSet: IndexSet) {
        let items = indexSet.compactMap{ section.contacts[safe: $0] }
        store.delete(items, modelContext)
    }
}
