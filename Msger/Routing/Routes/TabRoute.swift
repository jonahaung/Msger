//
//  TabRoute.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum TabRoute: Hashable {
    case inbox
    case contact
    case account
}
extension TabRoute: Identifiable, CaseIterable {
    var id: Self { self }
}
