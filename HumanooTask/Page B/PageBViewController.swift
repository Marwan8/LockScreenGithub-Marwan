//  
//  PageBViewController.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 23.02.21.
//

import UIKit

final class PageBViewController: UIViewController, PageBView {
    
    private let presenter: PageBPresenter
    private let imageView = UIImageView()
    private let usernameLabel = UILabel()

    init(presenter: PageBPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        setupSubviews()
        addSubviews()
        setupConstraints()
        
        presenter.viewDidLoad(view: self)
    }
    
    private func setupSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(usernameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),

            usernameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10),
            usernameLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor),
        ])
    }

    func showUser(name: String, imageURL: URL) {
        usernameLabel.text = name
        imageView.downloaded(from: imageURL)
    }
}
