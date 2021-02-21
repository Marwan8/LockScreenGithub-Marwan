//  
//  UnlockPatternInteractor.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 20.02.21.
//

import Foundation

final class UnlockPatternInteractor: UnlockPatternInteractorInput {
    
    public weak var output: UnlockPatternInteractorOutput?
    private var pageATrack: [Int]
    private var pageBTrack: [Int]

    init(pageATrack: [Int], pageBTrack: [Int]) {
        self.pageATrack = pageATrack
        self.pageBTrack = pageBTrack
    }

    func validate(track: [Int]) {
        if track == pageATrack {
            self.output?.validatePageATrackSuccess()
        } else if track == pageBTrack {
            self.output?.validatePageBTrackSuccess()
        } else {
            self.output?.validateTrackFailed()
        }
    }
}
