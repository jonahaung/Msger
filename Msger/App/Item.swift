//
//  Item.swift
//  Msger
//
//  Created by Aung Ko Min on 15/12/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
