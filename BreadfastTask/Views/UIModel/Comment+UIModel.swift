//
//  Comment+UIModel.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

extension Comment: CellUIModelProtocol {

    var title: String? {
        nil
    }

    var username: String? {
        self.name
    }


}
