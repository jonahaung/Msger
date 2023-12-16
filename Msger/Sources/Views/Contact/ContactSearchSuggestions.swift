//
//  CiontactSearchSuggestions.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import SwiftUI
import MsgerDataStore

struct ContactSearchSuggestions: View {
    let contacts: [AnyContact]
    var suggestions: [String] {
        Array(Set(contacts.map(\.name))).sorted()
    }
    var body: some View {
        ForEach(suggestions) {
            Text($0)
                .searchCompletion($0)
        }
    }
}
