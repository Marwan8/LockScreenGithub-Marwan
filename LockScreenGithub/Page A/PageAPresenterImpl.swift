//  
//  PageAPresenterImpl.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation

final class PageAPresenterImpl: PageAPresenter {
    
    private weak var view: PageAView?
    private let router: PageARouter
    private let interactor: PageAInteractorInput
    private var users: [GithubUser]
    
    init(router: PageARouter, interactor: PageAInteractorInput, users: [GithubUser]) {
        self.router = router
        self.interactor = interactor
        self.users = users
    }
    
    func viewDidLoad(view: PageAView) {
        self.view = view
        showList(users: self.users)
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
        interactor.save(user: user)
        self.router.openPageB(with: user)
    }

    private func showList(users: [GithubUser]) {
        let usernames =  users.map { $0.username }
        self.view?.showList(users: usernames)
    }
}

extension PageAPresenterImpl: PageAInteractorOutput {
    func fetchUserListSuccess(response: GithubResponse) {
        self.view?.hideProgress()
        self.users = response.items
        showList(users: self.users)
    }

    func fetchUserListFailed(error: Error?) {
        self.view?.hideProgress()
        router.showError(message: error?.localizedDescription ?? "")
    }
}
