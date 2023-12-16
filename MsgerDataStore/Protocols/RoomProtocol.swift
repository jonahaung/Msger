//
//  Room.swift
//  Msger
//
//  Created by Aung Ko Min on 15/12/23.
//

import Foundation
import SwiftData

public protocol RoomProtocol: PersistentModel, Identifiable {
    var id: String { get set }
    var name: String { get set }
}
