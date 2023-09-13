//
//  PostsViewModelProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import Foundation

protocol PostsViewModelProtocol {

    // - iVars
    var postsCount: Int { get }
    var onDataUpdate: (() -> Void)? { get set }

    // - iFunc
    func getCellModel(for index: Int) -> CellState
    func onSelect(index: Int)
}
