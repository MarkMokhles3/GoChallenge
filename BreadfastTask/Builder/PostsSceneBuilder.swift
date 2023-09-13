//
//  PostsSceneBuilder.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

class PostsSceneBuilder: PostsSceneBuilderProtocol {

    func getPostsViewController(router: PostsRouterProtocol) -> UIViewController {
        let dataSource = PostsAPIService()
        let viewModel = PostsViewModel(dataSource: dataSource, router: router)
        let viewController = PostsViewController(viewModel: viewModel)
        return viewController
    }

    func getPostDetailsViewController(post: Post, postID: Int) -> UIViewController {
        let dataSource = PostsAPIService()
        let viewModel = PostDetailsViewModel(dataSource: dataSource, post: post, postID: postID)
        let viewController = PostDetailsViewController(viewModel: viewModel)
        return viewController
    }
}
