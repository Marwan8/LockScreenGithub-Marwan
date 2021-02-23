//  
//  PageAInteractor.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation

final class PageAInteractor: PageAInteractorInput {
    
    public weak var output: PageAInteractorOutput?
    
    private let dataProvider: GithubUserDataProvider?


    init(dataProvider: GithubUserDataProvider) {
        self.dataProvider = dataProvider
    }

    func fetchList(user: String) {
        dataProvider?.fetchGithub(name: user, completion: { [weak self] (result, error) in
            if let reponse = result as? GithubResponse {
                self?.dataProvider?.users = reponse.items
                self?.output?.fetchUserListSuccess(response: reponse)
            } else {
                self?.output?.fetchUserListFailed(error: error)
            }
        })
    }

    func save(user: GithubUser) {
        self.dataProvider?.openedUser = user
    }
}
