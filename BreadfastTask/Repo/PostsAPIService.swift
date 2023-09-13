//
//  PostsAPIService.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import Foundation

class PostsAPIService: PostsAPIServiceProtocol {

    let scheme = "https"
    let baseURL = "gorest.co.in"

    func getPosts(pageIndex: Int, completion: @escaping (Result<[Post], Error>) -> Void) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = "/public/v2/posts"
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(pageIndex)")
        ]
        let url = components.url?.absoluteString ?? ""

        APIService.sharedService.request(url: url, completion: completion)
    }

    func getComments(postID: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {

        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = "/public/v2/posts/\(postID)/comments"
        
        let url = components.url?.absoluteString ?? ""

        APIService.sharedService.request(url: url, completion: completion)
    }
}
