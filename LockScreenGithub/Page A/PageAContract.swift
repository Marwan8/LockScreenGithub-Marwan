//  
//  PageAContract.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation

protocol PageAView: AnyObject {
    func showProgress()
    func hideProgress()
    func showList(users: [String])
}

protocol PageAPresenter: AnyObject {
    func viewDidLoad(view: PageAView)
    func search(user: String)
    func userTapped(at index: Int)
}

protocol PageAInteractorInput: AnyObject {
    func fetchList(user: String)
    func save(user: GithubUser)
}

protocol PageAInteractorOutput: AnyObject {
    func fetchUserListSuccess(response: GithubResponse)
    func fetchUserListFailed(error: Error?)
}

protocol PageARouter: AnyObject {
    func openPageB(with user: GithubUser)
    func showError(message: String)
}
