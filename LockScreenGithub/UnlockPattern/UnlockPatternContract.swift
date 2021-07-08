//  
//  UnlockPatternContract.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 20.02.21.
//

import Foundation

protocol UnlockPatternView: AnyObject {
    func showPatternStatus(valid: Bool)
}

protocol UnlockPatternPresenter: AnyObject {
    func viewDidLoad(view: UnlockPatternView)
    func validate(track: [Int])
}

protocol UnlockPatternInteractorInput: AnyObject {
    func validate(track: [Int])
}

protocol UnlockPatternInteractorOutput: AnyObject {
    func validatePageATrackSuccess()
    func validatePageBTrackSuccess()
    func validateTrackFailed()
}

protocol UnlockPatternRouter: AnyObject {
    func openPageA()
    func openPageB()
}
