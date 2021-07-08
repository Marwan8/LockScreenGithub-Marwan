//
//  GithubUser.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 23.02.21.
//
import Foundation

struct GithubResponse: Codable {
    let items: [GithubUser]
}

struct GithubUser: Codable {
    let username: String
    let imageURL: URL

    private enum CodingKeys : String, CodingKey {
        case username = "login", imageURL = "avatar_url"
    }
}
