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

    private let modelContext: ModelContext
    internal let account: MsgerDataStore.AnyAccount
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

    init(_ account: AnyAccount, _ modelContext: ModelContext) {
        self.account = account
        self.modelContext = .init(modelContext.container)
        Log("init")
    }

    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Contact>(sortBy: [SortDescriptor(\Contact.name)])
            contacts = try modelContext.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }

    func addSample() {
        let new = Contact.mock()
        modelContext.insert(new)
        fetchData()
    }
    func deleteItems(_ items: [AnyContact]) {
        items.forEach { each in
            modelContext.delete(each)
        }
        fetchData()
    }
}
