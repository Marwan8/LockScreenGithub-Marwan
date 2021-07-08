//
//  UnlockPatternInteractorMock.swift
//  LockScreenGithubTests
//
//  Created by Marwan Ayman on 24.02.21.
//

@testable import LockScreenGithub

class UnlockPatternInteractorMock: UnlockPatternInteractorInput {

    public weak var output: UnlockPatternInteractorOutput?

    var validateTrackCalled = false

    private var pageATrack: [Int]
    private var pageBTrack: [Int]

    init(pageATrack: [Int], pageBTrack: [Int]) {
        self.pageATrack = pageATrack
        self.pageBTrack = pageBTrack
    }

    func validate(track: [Int]) {
        validateTrackCalled = true
        if track == pageATrack {
            self.output?.validatePageATrackSuccess()
        } else if track == pageBTrack {
            self.output?.validatePageBTrackSuccess()
        } else {
            self.output?.validateTrackFailed()
        }
    }
}

class UnlockPatternViewMock: UnlockPatternView {
    var showPatternStatusCalled = false

    func showPatternStatus(valid: Bool) {
        showPatternStatusCalled = true
    }
}

class UnlockPatternRouterwMock: UnlockPatternRouter {
    var openPageACalled = false
    var openPageBCalled = false

    func openPageA() {
        openPageACalled = true
    }

    func openPageB() {
        openPageBCalled = true
    }
}
