//
//  GithubAPI.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 21.02.21.
//

import UIKit

class GithubAPI {
    enum APIRouter: Requestable {

        case fetchUsers(key: String)

        var path: String {
            return "search/users"
        }

        var parameters: Parameters? {
            switch self {
            case .fetchUsers(let key):
                return ["q": key]
            }
        }
    }
}

extension GithubAPI {

    func fetchGithubUser(name: String, completionHandler: @escaping RequestCompletion) {
        var completion: (Result<GithubResponse, Error>) -> Void
        completion = { result in
            switch result {
            case .success(let response):
                completionHandler(response, nil)
            case .failure(let error):
                completionHandler(nil, error as NSError)
            }
        }
        APIRouter.fetchUsers(key: name).request(completion: completion)
    }
}
