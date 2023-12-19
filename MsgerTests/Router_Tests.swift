//
//  Router_Tests.swift
//  MsgerTests
//
//  Created by Aung Ko Min on 19/12/23.
//

import XCTest
@testable import Msger
final class Router_Tests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_Router_currentTab_defaultToInbox() {
        let router = Router()
        XCTAssertTrue(router.currentTab == .inbox)
    }
    func test_Router_currentTab_isAdjustable() {
        let router = Router()
        router.route = .welcom
        XCTAssertTrue(router.route == .welcom)
    }
}
