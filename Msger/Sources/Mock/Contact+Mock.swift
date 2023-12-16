//
//  File.swift
//  
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
import XUI
import MsgerDataStore

extension Contact: MockDataPresentable {
    static func mock() -> Self {
        return Self.init(
            id: UUID().uuidString,
            phone: "+65\(Int.random(in: 80000000...99999999))",
            name: Lorem.fullName, photoURL: URL(string: Lorem.url)
        )
    }
}
