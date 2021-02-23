//  
//  PageBPresenterImpl.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 23.02.21.
//

import Foundation

final class PageBPresenterImpl: PageBPresenter {
    
    private weak var view: PageBView?
    private let router: PageBRouter
    private let user: GithubUser?

    init(router: PageBRouter, user: GithubUser?) {
        self.router = router
        self.user = user
    }
    
    func viewDidLoad(view: PageBView) {
        self.view = view
        guard let user = user else {
            return
        }
        self.view?.showUser(name: user.username, imageURL: user.imageURL)
    }
}
