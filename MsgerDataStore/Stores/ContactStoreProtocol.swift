//
//  ContactStore.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData

public protocol ContactStoreProtocol {

    var contacts: [AnyContact] { get set }
    var sections: [(letter: String, contacts: [AnyContact])] { get }
    
    func fetch(_ modelContext: ModelContext)
    func add(_ item: AnyContact, _ modelContext: ModelContext)
    func delete(_ items: [AnyContact], _ modelContext: ModelContext)
    init()
}
