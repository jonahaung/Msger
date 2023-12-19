//
//  NavRouter.swift
//  Msger
//
//  Created by Aung Ko Min on 18/12/23.
//

import SwiftUI

@Observable
final class NavRouter {

    var routes = NavigationPath()

    init(_ routes: [NavRoute]) {
        routes.forEach { self.routes.append($0) }
    }

    func push(_ route: AnyHashable) {
        routes.append(route)
    }
}
