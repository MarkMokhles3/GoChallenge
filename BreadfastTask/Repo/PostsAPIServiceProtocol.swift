//
//  PostsAPIServiceProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import Foundation

protocol PostsAPIServiceProtocol {
    func getPosts(completion: @escaping(Result<[Post],Error>) -> Void)
    func getComments(postID: Int, completion: @escaping(Result<[Comment],Error>) -> Void)
}
