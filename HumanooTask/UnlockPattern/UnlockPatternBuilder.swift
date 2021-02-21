//  
//  UnlockPatternBuilder.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 20.02.21.
//

import Foundation
import UIKit

final class UnlockPatternBuilder {
    
    public func build(pageATrack: [Int] = [0,1,2,5,8], pageBTrack: [Int] = [0,3,6]) -> UIViewController {
        let router = UnlockPatternRouterImpl()
        let interactor = UnlockPatternInteractor(pageATrack: pageATrack, pageBTrack: pageBTrack)
        let pattenViewModel = PatternViewModel(dotImage: UIImage(named: "dot"), dotSelectedImage: UIImage(named: "dot-selected"), lockSize: 3, trackLineColor: .blue, trackLineThickness: 5, maxPossibilities: 8)
        let presenter = UnlockPatternPresenterImpl(router: router, interactor: interactor)
        let view = UnlockPatternViewController(presenter: presenter, viewModel: pattenViewModel)
        
        router.viewController = view
        interactor.output = presenter
        return view
    }
    
}
