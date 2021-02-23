//  
//  PageAContract.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation

protocol PageAView: class {
    func showProgress()
    func hideProgress()
    func showList(users: [String])
}

protocol PageAPresenter: class {
    func viewDidLoad(view: PageAView)
    func search(user: String)
    func userTapped(at index: Int)
}

protocol PageAInteractorInput: class {
    func fetchList(user: String)
    func save(user: GithubUser)
}

protocol PageAInteractorOutput: class {
    func fetchUserListSuccess(response: GithubResponse)
    func fetchUserListFailed(error: Error?)
}

protocol PageARouter: class {
    func openPageB(with user: GithubUser)
}
