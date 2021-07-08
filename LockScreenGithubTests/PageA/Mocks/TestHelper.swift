//
//  TestHelper.swift
//  LockScreenGithubTests
//
//  Created by Marwan Ayman on 24.02.21.
//

import Foundation

enum StubFilename: String {
    case githubUsers = "GithubUsersStubResponse"
}

class TestHelper: NSObject {

    static func loadJSONFromFile<T: Decodable>(name: String) -> T {
        let bundle = Bundle(for: Self.self)
        let path = bundle.path(forResource: name, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
