//  
//  UnlockPatternRouterImpl.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 20.02.21.
//

import UIKit

final class UnlockPatternRouterImpl: UnlockPatternRouter {
    
    weak var viewController: UIViewController?

    func openPageA() {
        let controller = PageABuilder().build()
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }

    func openPageB() {
    }
}
