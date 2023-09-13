//
//  PostTableViewCell.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - iBoutlets

    @IBOutlet private weak var imgUserAvatar: UIImageView!
    @IBOutlet private weak var lblPostTitle: UILabel!
    @IBOutlet private weak var lblUserName: UILabel!
    @IBOutlet private weak var lblPostBody: UILabel!
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var stackViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var containerViewLeadingConstraint: NSLayoutConstraint!

    // MARK: - iFunctions
    
    func configureCell(with state: CellState) {
        switch state {
        case .compact(model: let model, containerViewSidesSpace: let containerViewSidesSpace):
            setupCompactView(containerViewSidesConstraints: containerViewSidesSpace)
            configureCell(with: model)
        case .full(model: let model):
            setupFullView()
            configureCell(with: model)
        }
    }

    private func configureCell(with model: CellUIModelProtocol) {
         if let title = model.title {
             lblPostTitle.text = title
             lblPostTitle.isHidden = false
         } else {
             lblPostTitle.isHidden = true
         }
         lblPostBody.text = model.body
         lblUserName.text = model.username
     }

    private func setupCompactView(containerViewSidesConstraints: CGFloat) {

        lblPostTitle.font = UIFont.systemFont(ofSize: 18.0)
        lblPostTitle.textColor = .black

        lblPostBody.font =  UIFont.systemFont(ofSize: 14.0)
        lblPostBody.textColor = .lightGray
        lblPostBody.numberOfLines = 3

        lblUserName.font =  UIFont.systemFont(ofSize: 15.0)
        lblUserName.textColor = .darkGray

        //Set corner and shadow to view
        viewContainer.setCornerRadius(radius: 8)
        viewContainer.layer.borderWidth = 1
        viewContainer.layer.borderColor = UIColor(red: 235/255.0, green: 237/255.0, blue: 239/255.0, alpha: 1.0).cgColor

        stackViewTopConstraint.constant = 15
        stackViewBottomConstraint.constant = 15

        containerViewTrailingConstraint.constant = containerViewSidesConstraints
        containerViewLeadingConstraint.constant = containerViewSidesConstraints
    }

    private func setupFullView() {
        lblPostTitle.font = UIFont.systemFont(ofSize: 24.0)
        lblPostTitle.textColor = .black

        lblPostBody.font = UIFont.systemFont(ofSize: 16.0)
        lblPostBody.textColor = .gray
        lblPostBody.numberOfLines = 0

        lblUserName.font = UIFont.systemFont(ofSize: 18.0)
        lblUserName.textColor = .darkGray

        viewContainer.layer.borderWidth = 0

        stackViewTopConstraint.constant = 0
        stackViewBottomConstraint.constant = 0
    }
}
