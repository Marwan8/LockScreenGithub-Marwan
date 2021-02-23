//  
//  PageAPresenterImpl.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation

final class PageAPresenterImpl: PageAPresenter {
    
    private weak var view: PageAView?
    private let router: PageARouter
    private let interactor: PageAInteractorInput
    private var users: [GithubUser] = []
    
    init(router: PageARouter, interactor: PageAInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: PageAView) {
        self.view = view
    }

    func search(user: String) {
        self.view?.showProgress()
        self.interactor.fetchList(user: user)
    }

    func userTapped(at index: Int) {
        guard index < self.users.count else {
            return
        }
        let user = self.users[index]
        self.router.openPageB(with: user)
    }
}

extension PageAPresenterImpl: PageAInteractorOutput {
    func fetchUserListSuccess(response: GithubResponse) {
        self.view?.hideProgress()
        let usernames =  response.items.map { $0.username }
        self.users = response.items
        self.view?.showList(users: usernames)
    }

    func fetchUserListFailed(error: Error?) {
        // Error handling
    }
}
