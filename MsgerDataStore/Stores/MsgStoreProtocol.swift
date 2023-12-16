//
//  MsgsStore.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import SwiftData

public protocol MsgStoreProtocol {
    var msgs: [any MsgProtocol] { get set }
    init(_ account: any AccountProtocol, _ modelContext: ModelContext)
    func fetchData()
}
