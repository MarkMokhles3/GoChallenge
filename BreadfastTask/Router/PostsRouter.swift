//
//  PostsRouter.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

class PostsRouter: PostsRouterProtocol {

    // MARK: - Private

    private var navigationController: UINavigationController?
    private let builder: PostsSceneBuilderProtocol

    init(postsSceneBuilder: PostsSceneBuilderProtocol) {
        self.builder = postsSceneBuilder
    }

    func getRootViewController() -> UINavigationController {
        let viewController = builder.getPostsViewController(router: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        return navigationController
    }

    func rootToDetails(post: Post, postID: Int) {
        let viewController = builder.getPostDetailsViewController(post: post, postID: postID)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
