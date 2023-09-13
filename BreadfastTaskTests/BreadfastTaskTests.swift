//
//  BreadfastTaskTests.swift
//  BreadfastTaskTests
//
//  Created by Mark Mokhles on 13/09/2023.
//

import XCTest
@testable import BreadfastTask

final class BreadfastTaskTests: XCTestCase {

    private var sut: PostsViewModel! // System underTest
    private var dataSource: PostsAPIServiceMock!
    private var router: RouterMock!

    override func setUpWithError() throws {
        dataSource = PostsAPIServiceMock()
        router = RouterMock()
        sut = PostsViewModel(dataSource: dataSource, router: router)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testPostViewModel_whenCalledSelectedIndex_RouteToDetailsWithThisIndex() {
        // given
        let selectedIndex = 1
        // when
        sut.onSelect(index: selectedIndex)
        // then
        XCTAssertTrue(router.calledRouteToDetails)
    }
}
