//
//  RouterMock.swift
//  BreadfastTaskTests
//
//  Created by Mark Mokhles on 13/09/2023.
//

import UIKit
import Foundation
@testable import BreadfastTask

class RouterMock: PostsRouterProtocol {

    var calledRouteToDetails = false

    func getRootViewController() -> UINavigationController {
        return UINavigationController()
    }

    func rootToDetails(post: BreadfastTask.Post, postID: Int) {
        calledRouteToDetails = true
    }
}

