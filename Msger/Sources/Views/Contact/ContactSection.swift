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

    var section: (letter: String, contacts: [MsgerDataStore.AnyContact])
    var body: some View {
        Section {
            ForEach(section.contacts, id: \.id) {
                ContactRow(contact: $0)
            }
        } header: {
            Text(section.letter)
        } footer: {
            Text("total \(section.contacts.count)")
        }
    }
}
