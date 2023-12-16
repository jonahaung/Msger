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
    var sections = [(letter: String, contacts: [AnyContact])]()

    init(_ account: AnyAccount, _ modelContext: ModelContext) {
        self.account = account
        self.modelContext = .init(modelContext.container)
        Log("init")
    }

    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Contact>(sortBy: [SortDescriptor(\Contact.name)])
            contacts = try modelContext.fetch(descriptor)
            sections = Dictionary(grouping: contacts) { (contact) -> Character in
                return contact.name.first!
            }
            .map { (key: Character, value: [AnyContact]) -> (letter: String, contacts: [AnyContact]) in
                (letter: String(key), contacts: value)
            }
            .sorted { $0.letter < $1.letter }
        } catch {
            print("Fetch failed")
        }
    }

    func addSample() {
        let new = Contact.mock()
        modelContext.insert(new)
        fetchData()
    }
    func deleteItems(_ indexPaths: [IndexPath]) {
        indexPaths.forEach { each in
            sections.enumerated().forEach { (i, secion) in
                if i == each.section {
                    let item = secion.contacts[each.row]
                    modelContext.delete(item)
                }
            }
        }
        fetchData()
    }
}
