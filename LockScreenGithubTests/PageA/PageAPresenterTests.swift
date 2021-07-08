//
//  PageAPresenterTests.swift
//  LockScreenGithubTests
//
//  Created by Marwan Ayman on 24.02.21.
//

@testable import LockScreenGithub
import XCTest

class PageAPresenterTests: XCTestCase {

    private var sut: PageAPresenterImpl!
    private var router: PageARouterMock!
    private var view: PageAViewMock!
    private var interactor: PageAInteractorMock!

    override func setUp() {
        super.setUp()
        router = PageARouterMock()
        view = PageAViewMock()
        interactor = PageAInteractorMock(reponse: githubReponse())

        sut = PageAPresenterImpl(router: router, interactor: interactor, users: [])
        interactor.output = sut

        sut.viewDidLoad(view: view)
    }

    private func githubReponse() -> GithubResponse {
        let reponse: GithubResponse = TestHelper.loadJSONFromFile(name: StubFilename.githubUsers.rawValue)
        return reponse
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testShouldSetupUiOnViewDidLoad() {
        // When
        sut.viewDidLoad(view: view)

        // Then
        XCTAssertTrue(view.showListUsersCalled)
    }

    func testSearchUser() {
        // When
        sut.search(user: "eric")

        // Then
        XCTAssertTrue(view.showProgressCalled)
        XCTAssertTrue(interactor.fetchListUsersCalled)
    }

    func testUserRowTapped() {

        // Given
        let index = 0
        interactor.fetchList(user: "eric")

        // When
        sut.userTapped(at: index)

        // Then
        XCTAssertTrue(router.openPageBCalled)
        XCTAssertTrue(interactor.saveUserCalled)
    }


    func testUserTappedOutOfIndex() {

        // Given
        let index = 5000

        // When
        sut.userTapped(at: index)

        // Then
        XCTAssertFalse(router.openPageBCalled)
        XCTAssertFalse(interactor.saveUserCalled)
    }


    func testFetchListFailure() {

        // Given
        interactor = PageAInteractorMock(reponse: nil)
        sut = PageAPresenterImpl(router: router, interactor: interactor, users: [])
        interactor.output = sut

        sut.viewDidLoad(view: view)

        // When
        sut.search(user: "eric")

        // Then
        XCTAssertTrue(router.showErrorCalled)
        XCTAssertTrue(view.hideProgressCalled)
    }
}
