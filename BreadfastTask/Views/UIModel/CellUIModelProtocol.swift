//
//  CellUIModelProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

protocol CellUIModelProtocol {

    // iVars
    var title: String? { get }
    var body: String? { get }
    var username: String? { get }
}

enum CellState {
    case compact(model: CellUIModelProtocol, containerViewSidesSpace: CGFloat)
    case full(model: CellUIModelProtocol)
}
