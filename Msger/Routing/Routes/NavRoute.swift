//
//  NavRoute.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum NavRoute: Hashable {
    case chat
}
extension NavRoute: Identifiable {
    var id: Self { self }
}
