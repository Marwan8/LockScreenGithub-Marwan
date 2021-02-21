//  
//  UnlockPatternContract.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 20.02.21.
//

import Foundation

protocol UnlockPatternView: class {
    func showPatternStatus(valid: Bool)
}

protocol UnlockPatternPresenter: class {
    func viewDidLoad(view: UnlockPatternView)
    func validate(track: [Int])
}

protocol UnlockPatternInteractorInput: class {
    func validate(track: [Int])
}

protocol UnlockPatternInteractorOutput: class {
    func validatePageATrackSuccess()
    func validatePageBTrackSuccess()
    func validateTrackFailed()
}

protocol UnlockPatternRouter: class {
    func openPageA()
    func openPageB()
}
