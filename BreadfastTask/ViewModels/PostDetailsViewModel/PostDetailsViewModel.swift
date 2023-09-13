//
//  PostDetailsViewModel.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

class PostDetailsViewModel: PostDetailsViewModelProtocol {

    init(dataSource: PostsAPIServiceProtocol, post: Post, postID: Int) {
        self.post = post
        self.postID = postID
        self.dataSource = dataSource
        getComments()
    }

    // MARK: - private iVars

    private var post: Post
    private var comments: [Comment] = []
    private var postID: Int?
    private var dataSource: PostsAPIServiceProtocol

    // MARK: -  iVars

    var title: String? {
        post.title
    }

    var userName: Int? {
         post.userID
    }

    var body: String? {
        post.body
    }
    var onDataUpdate: (() -> Void)?
    var isSuccess: Bool = false

    var commentsCount: Int {
        return comments.count
    }
    var numberOfSections: Int {
        return 2
    }

    // MARK: - iFunctions
    
    func getComments() {
        dataSource.getComments(postID: postID ?? 0) { [weak self] result in
            switch result {
            case .success(let comments):
                self?.comments.append(contentsOf: comments)
                self?.onDataUpdate?()
                self?.isSuccess = true
            case .failure(let error):
                print(error)
            }
        }
    }

    func getCellModel(for index: IndexPath) -> CellState {
        if index.section == 0 {
            return .full(model: post)
        } else {
            return .compact(model: getCommentsModel(for: index.row), containerViewSidesSpace: 25)
        }
    }

    func numberOfRows(for section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return commentsCount
        }
    }

    func getCommentsModel(for index: Int) -> CellUIModelProtocol {
        return comments[index]
    }
}
