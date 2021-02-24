//
//  UnlockPatternPresenterTests.swift
//  HumanooTaskTests
//
//  Created by Marwan Ayman on 24.02.21.
//

@testable import HumanooTask
import XCTest

class UnlockPatternPresenterTests: XCTestCase {

    private var sut: UnlockPatternPresenterImpl!
    private var router: UnlockPatternRouterwMock!
    private var view: UnlockPatternViewMock!
    private var interactor: UnlockPatternInteractorMock!

    override func setUp() {
        super.setUp()
        router = UnlockPatternRouterwMock()
        view = UnlockPatternViewMock()
        interactor = UnlockPatternInteractorMock(pageATrack: [0,1,2,5,8], pageBTrack: [0,3,6])

        sut = UnlockPatternPresenterImpl(router: router, interactor: interactor)
        interactor.output = sut

        sut.viewDidLoad(view: view)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testValidateSuccessATrack() {
        // Given
        let track = [0,1,2,5,8]

        // When
        sut.validate(track: track)

        // Then
        XCTAssertTrue(view.showPatternStatusCalled)
        XCTAssertTrue(router.openPageACalled)
    }

    func testValidateSuccessBTrack() {
        // Given
        let track = [0,3,6]

        // When
        sut.validate(track: track)

        // Then
        XCTAssertTrue(view.showPatternStatusCalled)
        XCTAssertTrue(router.openPageBCalled)
    }

    func testValidateFailedTrack() {
        // Given
        let track = [1,2,3]

        // When
        sut.validate(track: track)

        // Then
        XCTAssertTrue(view.showPatternStatusCalled)
        XCTAssertFalse(router.openPageBCalled)
    }
}
