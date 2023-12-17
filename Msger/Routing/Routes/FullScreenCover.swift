//
//  FullScreenCover.swift
//  Msger
//
//  Created by Aung Ko Min on 16/12/23.
//

import Foundation

enum FullScreenCover: Hashable {
    case none
}
extension FullScreenCover: Identifiable {
    var id: Self { self }
}
