//
//  Account.swift
//  Msger
//
//  Created by Aung Ko Min on 15/12/23.
//

import Foundation
import SwiftData

public protocol AccountProtocol: Hashable, Identifiable, Equatable {
    var id: String { get set }
    var phone: String { get set }
    var name: String { get set }
    var photoURL: URL? { get set }
    init(id: String, phone: String, name: String, photoURL: URL?)
    static var current: Self { get }
}
