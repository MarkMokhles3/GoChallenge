//
//  Post+UIModel.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

extension Post: CellUIModelProtocol {
    var username: String? {
        guard let userName = userID else { return nil }
        return "\(userName)"
    }
}
