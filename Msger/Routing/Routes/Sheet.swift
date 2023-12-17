//
//  Sheet.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum Sheet: Hashable {
    case none
}
extension Sheet: Identifiable {
    var id: Self { self }
}
