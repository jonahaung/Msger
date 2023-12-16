//
//  Account.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData
import MsgerDataStore

struct Account: AccountProtocol {
    var id: String
    var phone: String
    var name: String
    var photoURL: URL?

    init(id: String, phone: String, name: String, photoURL: URL? = nil) {
        self.id = id
        self.phone = phone
        self.name = name
        self.photoURL = photoURL
    }
}

extension Account {
    static var current: Self {
        .init(id: "aung", phone: "88585229", name: "Aung Ko Min")
    }
}
