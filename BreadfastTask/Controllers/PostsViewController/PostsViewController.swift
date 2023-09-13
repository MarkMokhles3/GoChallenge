//
//  PostsViewController.swift
//  BreadfastTask
//
//  Created by Mark Mokhles on 12/09/2023.
//

import UIKit

class PostsViewController: UIViewController {

    // MARK: - iBoutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - init

    init(viewModel: PostsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "\(PostsViewController.self)", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - iVars

    var viewModel: PostsViewModelProtocol

    // MARK: - iConstant

    var activityView = UIActivityIndicatorView(style: .large)

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "GOoOo"

        // ShowActivityIndicator
        showActivityIndicator()
        
        // Data Update
        viewModel.onDataUpdate = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.hideActivityIndecator()
            }
        }
        configureTableView()
    }

    // MARK: - Configure TableView

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostTableViewCell.self))
    }

    // MARK: - showActivityIndicatory

    func showActivityIndicator() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }

    // MARK: - hideActivityIndicatory

    func hideActivityIndecator() {
        self.activityView.stopAnimating()
    }
}

//MARK: - TableView Dtatasource

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as?  PostTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.getCellModel(for: indexPath.row)
        cell.configureCell(with: model)

        return cell
    }
}

// MARK: - TableView Delegate

extension PostsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.viewModel.onSelect(index: indexPath.row)
    }
}
