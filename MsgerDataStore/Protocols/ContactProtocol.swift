//
//  Contact.swift
//  Msger
//
//  Created by Aung Ko Min on 15/12/23.
//

import Foundation
import SwiftData

public protocol ContactProtocol: PersistentModel, Identifiable {
    var id: String { get set }
    var phone: String { get set }
    var name: String { get set }
    var photoURL: URL? { get set }
    var lastSeenDate: Date? { get set }
    init(
        id: String,
        phone: String,
        name: String,
        photoURL: URL?
    )
}
