//
//  Comment.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

struct Comment: Codable {
    var id, postID: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case id
        case postID = "post_id"
        case name, email, body
    }
}
