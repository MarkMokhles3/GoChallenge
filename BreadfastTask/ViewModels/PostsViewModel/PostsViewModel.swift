//
//  PostsViewModel.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import Foundation

class PostsViewModel: PostsViewModelProtocol {

    // MARK: - init

    init(dataSource: PostsAPIServiceProtocol, router: PostsRouterProtocol) {
        self.dataSource = dataSource
        self.router = router
        getPosts()
    }

    // MARK: - Private iVars

    private var posts: [Post] = []
    private var dataSource: PostsAPIServiceProtocol
    private var router: PostsRouterProtocol

    // MARK: - iVars

    var onDataUpdate: (() -> Void)?
    var postsCount: Int {
        return posts.count
    }
    
    // MARK: - Get PostsList

    private func getPosts() {

        dataSource.getPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts.append(contentsOf: posts)
                self?.onDataUpdate?()
            case .failure(let error):
                print(error)
            }
        }
    }

    func getCellModel(for index: Int) -> CellState {
        return .compact(model: posts[index], containerViewSidesSpace: 10)
    }

    func onSelect(index: Int) {
        router.rootToDetails(post: posts[index], postID: posts[index].id ?? 0)
    }
}
