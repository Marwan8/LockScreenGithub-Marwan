//
//  GithubUserDataProvider.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import UIKit

class GithubUserDataProvider {
    private let githubAPI = GithubAPI()
    private let usersKey = "users"

    static let shared = GithubUserDataProvider()
    var users: [GithubUser] {
        get {
            return UserDefaults.standard.decode(for: [GithubUser].self, using: usersKey) ?? []
        }
        set {
            UserDefaults.standard.encode(for: newValue, using: usersKey)
        }
    }

    var openedUser: GithubUser? {
        get {
           return UserDefaults.standard.decode(for: GithubUser.self, using: String(describing: GithubUser.self))
        }
        set {
            UserDefaults.standard.encode(for: newValue, using: String(describing: GithubUser.self))
        }
    }

    func fetchGithub(name: String, completion:  @escaping RequestCompletion) {
        githubAPI.fetchGithubUser(name: name, completionHandler: completion)
    }
}
