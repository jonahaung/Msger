//
//  ContactRow.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore
import XUI

struct ContactRow: View {
    let contact: AnyContact
    var body: some View {
        NavigationLink(value: contact) {
            Text(contact.name)
                ._badged(contact.phone)
        }
    }
}
