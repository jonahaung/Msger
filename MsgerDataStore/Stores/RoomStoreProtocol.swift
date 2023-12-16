//
//  RoomStore.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData

public protocol RoomStoreProtocol {
    var rooms: [AnyRoom] { get set }
    init(_ account: any AccountProtocol, _ modelContext: ModelContext)
    func fetchData ()
}

