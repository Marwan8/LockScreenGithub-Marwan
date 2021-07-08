//  
//  UnlockPatternPresenterImpl.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 20.02.21.
//

import Foundation

final class UnlockPatternPresenterImpl: UnlockPatternPresenter {
    
    private weak var view: UnlockPatternView?
    private let router: UnlockPatternRouter
    private let interactor: UnlockPatternInteractorInput

    init(router: UnlockPatternRouter, interactor: UnlockPatternInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad(view: UnlockPatternView) {
        self.view = view
    }

    func validate(track: [Int]) {
        interactor.validate(track: track)
    }
}

extension UnlockPatternPresenterImpl: UnlockPatternInteractorOutput {

    func validatePageATrackSuccess() {
        router.openPageA()
        self.view?.showPatternStatus(valid: true)
    }

    func validatePageBTrackSuccess() {
        router.openPageB()
        self.view?.showPatternStatus(valid: true)
    }

    func validateTrackFailed() {
        self.view?.showPatternStatus(valid: false)
    }
}
