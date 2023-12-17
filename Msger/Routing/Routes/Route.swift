//
//  Routing.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum Route: Hashable {
    case splashScreen
    case welcom
    case main(MainRoute)
}
