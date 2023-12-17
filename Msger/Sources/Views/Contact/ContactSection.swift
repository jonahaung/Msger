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

    private let store: ContactStoreProtocol
    private let section: (letter: String, contacts: [MsgerDataStore.AnyContact])

    init(_ store: @autoclosure @escaping () -> ContactStoreProtocol, section: (letter: String, contacts: [MsgerDataStore.AnyContact])) {
        self.store = store()
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
        store.deleteItems(items)
    }
}
