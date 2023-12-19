//
//  ContactListNavigationStack.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore
import XUI
struct ContactMainView: View {

    @Environment(\.modelContext) private var context
    private let store = MockContactStore()

    var body: some View {
        ContactList()
            .environment(store)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            let item = Contact.mock()
                            store.add(item, context)
                        }
                    } label: {
                        Image(systemSymbol: .plus)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .task {
                if store.contacts.isEmpty {
                    store.fetch(context)
                }
            }
    }
}
