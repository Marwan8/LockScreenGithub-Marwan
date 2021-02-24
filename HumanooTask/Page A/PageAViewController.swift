//  
//  PageAViewController.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import UIKit

final class PageAViewController: UIViewController, PageAView {
    
    private let presenter: PageAPresenter
    private let tableView = UITableView(frame: .zero)
    private let activityView =  UIActivityIndicatorView(style: .large)
    private var username = [String]()
    private let searchBar = UISearchBar()

    init(presenter: PageAPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        title = &&"pageA"
        
        setupSubviews()
        addSubviews()

        presenter.viewDidLoad(view: self)
    }
    
    private func setupSubviews() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = &&"searchUser"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self

        tableView.tableHeaderView = searchBar
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
    }
    
    private func addSubviews() {
        tableView.frame = view.frame
        activityView.center = self.view.center

        view.addSubview(tableView)
        view.addSubview(activityView)
    }
    
    func showProgress() {
        activityView.startAnimating()
    }
    
    func hideProgress() {
        activityView.stopAnimating()
    }

    func showList(users: [String]) {
        self.username = users
        tableView.reloadData()
    }
}

extension PageAViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.username.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.textLabel?.text = username[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.userTapped(at: indexPath.row)
    }
}

extension PageAViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.presenter.search(user: text)
    }
}
