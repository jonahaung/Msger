//
//  MockContactsStore.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData
import MsgerDataStore
import XUI

@Observable
final class MockContactStore: ContactStoreProtocol {

    init() {}

    var contacts = [AnyContact]()
    var sections: [(letter: String, contacts: [AnyContact])] {
        Dictionary(grouping: contacts.lazy) { (contact) -> Character in
            return contact.name.first ?? Character("")
        }
        .map { (key: Character, value: [AnyContact]) -> (letter: String, contacts: [AnyContact]) in
            (letter: String(key), contacts: value)
        }
        .sorted { $0.letter < $1.letter }
    }

    func fetch(_ modelContext: ModelContext) {
        print("fetching")
        do {
            let descriptor = FetchDescriptor<Contact>(sortBy: [SortDescriptor(\Contact.name)])
            contacts = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    func add(_ item: AnyContact, _ modelContext: ModelContext) {
        modelContext.insert(item)
        fetch(modelContext)
    }
    func delete(_ items: [AnyContact], _ modelContext: ModelContext) {
        items.forEach { each in
            modelContext.delete(each)
        }
        fetch(modelContext)
    }
}
