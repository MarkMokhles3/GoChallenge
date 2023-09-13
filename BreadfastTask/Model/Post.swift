//
//  Post.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import Foundation

struct Post: Codable {
    var id, userID: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, body
    }
}
