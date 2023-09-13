//
//  PostsRouterProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

protocol PostsRouterProtocol {
    func getRootViewController() -> UINavigationController
    func rootToDetails(post: Post, postID: Int)
}
