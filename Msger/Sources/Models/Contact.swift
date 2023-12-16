//
//  Contact.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData
import MsgerDataStore

@Model
class Contact: ContactProtocol {

    @Attribute(.unique) var id: String
    @Attribute(.unique) var phone: String
    var name: String
    var photoURL: URL?
    var lastSeenDate: Date?

    required init(id: String, phone: String, name: String, photoURL: URL?) {
        self.id = id
        self.phone = phone
        self.name = name
        self.photoURL = photoURL
        self.lastSeenDate = .now
    }
}
