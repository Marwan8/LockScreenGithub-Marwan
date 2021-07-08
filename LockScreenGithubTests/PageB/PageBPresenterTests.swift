//
//  PageBPresenterTests.swift
//  LockScreenGithubTests
//
//  Created by Marwan Ayman on 24.02.21.
//

@testable import LockScreenGithub
import XCTest

class PageBPresenterTests: XCTestCase {

    private var sut: PageBPresenterImpl!
    private var router: PageBRouterMock!
    private var view: PageBViewMock!

    override func setUp() {
        super.setUp()
        router = PageBRouterMock()
        view = PageBViewMock()

        let user = GithubUser(username: "Erirc", imageURL: URL(string: "https://avatars.githubusercontent.com/u/4592?v=4")!)
        sut = PageBPresenterImpl(router: router, user: user)

        sut.viewDidLoad(view: view)
    }


    func testShowUserDetials() {
        // When
        sut.viewDidLoad(view: view)

        // Then
        XCTAssertTrue(view.showUserDetialsCalled)
    }

    func testShowNoUser() {
        // Given
        router = PageBRouterMock()
        view = PageBViewMock()
        sut = PageBPresenterImpl(router: router, user: nil)

        // When
        sut.viewDidLoad(view: view)
        
        // Then
        XCTAssertFalse(view.showUserDetialsCalled)
    }
}


class PageBViewMock: PageBView {

    var showUserDetialsCalled = false

    func showUser(name: String, imageURL: URL) {
        showUserDetialsCalled = true
    }
}

class PageBRouterMock: PageBRouter {
}
