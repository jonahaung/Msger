//
//  ContactStore.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData

public protocol ContactStoreProtocol {

    var account: AnyAccount { get }
    var contacts: [AnyContact] { get set }
    var sections: [(letter: String, contacts: [AnyContact])] { get }

    init(_ account: AnyAccount, _ modelContext: ModelContext)

    func fetchData()
    func addSample()
    func deleteItems(_ items: [AnyContact])
}
