//
//  PostDetailsViewModelProtocol.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import Foundation

protocol PostDetailsViewModelProtocol {
    // - iVars
    var title: String? { get }
    var userName: Int? { get }
    var body: String? { get }
    var isSuccess: Bool { get }
    var commentsCount: Int { get }
    var numberOfSections: Int { get }
    var onDataUpdate: (() -> Void)? { get set }

    // - iFunc
    func getCellModel(for index: IndexPath) -> CellState
    func numberOfRows(for section: Int) -> Int
}
