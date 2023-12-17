//
//  MainRoute.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum MainRoute: Hashable {
    case login
    case tab(TabRoute)
}
extension MainRoute: Identifiable {
    var id: Self { self }
}
