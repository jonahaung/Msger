//
//  Msg.swift
//
//
//  Created by Aung Ko Min on 15/12/23.
//

import Foundation
import SwiftData

public protocol MsgProtocol: PersistentModel, Identifiable {
    var id: String { get }
    var text: String { get set }
    var date: Date { get set }
    init(
        id: String,
        text: String,
        date: Date
    )
    static func random() -> any MsgProtocol
}
