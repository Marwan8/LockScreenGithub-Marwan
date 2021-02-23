//  
//  PageARouterImpl.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import UIKit

final class PageARouterImpl: PageARouter {
    
    weak var viewController: UIViewController?

    func openPageB(with user: GithubUser) {
        let controller = PageBBuilder().build(user: user)
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }

    func showError(message: String) {
        self.viewController?.showAlert("", message: message)
    }
}
