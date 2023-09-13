//
//  PostDetailsViewController.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 13/09/2023.
//

import UIKit

class PostDetailsViewController: UIViewController {

    // MARK: - iBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - init

    init(viewModel: PostDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "\(PostDetailsViewController.self)", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private iVars

    private var viewModel: PostDetailsViewModelProtocol

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        showActivityIndicator()
        viewModel.onDataUpdate = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.hideActivityIndecator()
            }
        }
        configureTableView()
    }

    // MARK: - Private iFunc

    private func setupView() {
        activityIndicator.style = .medium
    }

    // MARK: - Configure TableView

    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostTableViewCell.self))
    }

    // MARK: - showActivityIndicatory

    func showActivityIndicator() {
        self.activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    // MARK: - hideActivityIndicatory

    func hideActivityIndecator() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
}

//MARK: - TableView Dtatasource

extension PostDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(for: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as?  PostTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.getCellModel(for: indexPath)
        cell.configureCell(with: model)

        return cell
    }
}


extension PostDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let commentView = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
            let label = UILabel(frame: CGRect(x: 25.0, y: 4.0, width: commentView.bounds.size.width - 16.0, height: commentView.bounds.size.height - 8.0))
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            label.text = "Comments"
            commentView.addSubview(label)
            return commentView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 30.0
        } else {
            return 0.0
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if viewModel.isSuccess {
            if section == 1, viewModel.numberOfRows(for: 1) == 0 {
                let commentView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
                let label = UILabel(frame: CGRect(x: tableView.frame.width / 3, y: 25.0, width: commentView.bounds.size.width - 16.0, height: commentView.bounds.size.height - 8.0))
                label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                label.text = "No comments yet"
                commentView.addSubview(label)
                return commentView
            }
        }
            return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 30.0
        } else {
            return 0.0
        }
    }
}
