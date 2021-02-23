//
//  GithubUserDataProvider.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import UIKit

class GithubUserDataProvider {
    static let shared = GithubUserDataProvider()
    private let githubAPI = GithubAPI()

    func fetchGithub(name: String, completion:  @escaping RequestCompletion) {
        githubAPI.fetchGithubUser(name: name, completionHandler: completion)
    }
}
