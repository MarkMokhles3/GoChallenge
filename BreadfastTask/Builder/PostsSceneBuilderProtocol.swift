//
//  PostsSceneBuilderProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

protocol PostsSceneBuilderProtocol {
    func getPostsViewController(router: PostsRouterProtocol) -> UIViewController
    func getPostDetailsViewController(post: Post, postID: Int) -> UIViewController
}

//Build instead of get
