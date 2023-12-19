//
//  Router.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation
@Observable
final class Router {

    var route: Route = .main(.tab(.inbox))

    func route(to tab: TabRoute) {
        route = .main(.tab(tab))
    }

    var currentTab: TabRoute {
        get {
            guard case let .main(.tab(currentTab)) =  route else { return .inbox }
            return currentTab
        }
        set {
            route = .main(.tab(newValue))
        }
    }
    func route(to nav: NavRoute) {
        guard case let .main(.tab(currentTab)) =  route else { return }
        
    }
}
