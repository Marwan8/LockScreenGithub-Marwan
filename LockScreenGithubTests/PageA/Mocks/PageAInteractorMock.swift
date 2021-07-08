//
//  PageAInteractorMock.swift
//  LockScreenGithubTests
//
//  Created by Marwan Ayman on 24.02.21.
//

@testable import LockScreenGithub

class PageAInteractorMock: PageAInteractorInput {

    var fetchListUsersCalled = false
    var saveUserCalled = false

    public weak var output: PageAInteractorOutput?
    private let reponse: GithubResponse?

    init(reponse: GithubResponse?) {
        self.reponse = reponse
    }
    
    func fetchList(user: String) {
        fetchListUsersCalled = true
        if let mockedReponse = self.reponse {
            output?.fetchUserListSuccess(response: mockedReponse)
        } else {
            output?.fetchUserListFailed(error: nil)
        }
    }

    func save(user: GithubUser) {
        saveUserCalled = true
    }
}

class PageARouterMock: PageARouter {

    var openPageBCalled = false
    var showErrorCalled = false

    func openPageB(with user: GithubUser) {
        openPageBCalled = true
    }

    func showError(message: String) {
        showErrorCalled = true
    }
}

class PageAViewMock: PageAView {

    var showProgressCalled = false
    var hideProgressCalled = false
    var showListUsersCalled = false

    func showProgress() {
        showProgressCalled = true
    }

    func hideProgress() {
        hideProgressCalled = true
    }

    func showList(users: [String]) {
        showListUsersCalled = true
    }
}
