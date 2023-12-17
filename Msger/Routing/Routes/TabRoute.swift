//
//  TabRoute.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum TabRoute: Hashable {
    case inbox([NavRoute])
    case contact([NavRoute])
    case account([NavRoute])
}
extension TabRoute: Identifiable, CaseIterable {
    var id: Self { self }
    static var allCases: [TabRoute] = [.inbox([]), .contact([]), .account([])]
}
