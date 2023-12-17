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
    }

    var body: some View {
        NavigationStack {
            ContactList(store)
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            store.addSample()
                        } label: {
                            Image(systemSymbol: .plus)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                    }
                }
                .navigationDestination(for: Contact.self) {
                    Text($0.id)
                        .navigationTitle($0.name)
                }
        }
    }
}
