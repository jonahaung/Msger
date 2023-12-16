//
//  ContactListNavigationStack.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore
import XUI

struct ContactListNavigationStack: View {

    @Environment(\.prefersTabNavigation) private var prefersTabNavigation
    private let store: ContactStoreProtocol

    init(_ store: @autoclosure @escaping () -> ContactStoreProtocol) {
        self.store = store()
        self.store.fetchData()
    }
    
    var body: some View {
        NavigationStack {
            ContactList(store)
                .navigationTitle("Contacts")
                .navigationDestination(for: Contact.self) { contact in
                    Text(contact.id)
                        .navigationTitle(contact.name)
                }
        }
    }
}
