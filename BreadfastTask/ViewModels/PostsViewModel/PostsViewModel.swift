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
    private var isFetching: Bool = false
    private var pageIndex: Int = 1

    // MARK: - iVars

    var onDataUpdate: (() -> Void)?
    var postsCount: Int {
        return posts.count
    }
    var paginationTrigerIndex: Int {
        return posts.count - 3
    }
    
    // MARK: - Get PostsList

    private func getPosts() {

        isFetching = true

        dataSource.getPosts(pageIndex: pageIndex) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts.append(contentsOf: posts)
                self?.onDataUpdate?()
            case .failure(let error):
                print(error)
            }
            self?.isFetching = false
        }
    }

    func getCellModel(for index: Int) -> CellState {
        defer {
            if !isFetching, index >= paginationTrigerIndex {
                pageIndex += 1
                getPosts()
            }
        }
        return .compact(model: posts[index], containerViewSidesSpace: 10)
    }

    func onSelect(index: Int) {
        router.rootToDetails(post: posts[index], postID: posts[index].id ?? 0)
    }
}
