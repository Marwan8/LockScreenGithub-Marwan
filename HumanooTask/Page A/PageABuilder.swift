//  
//  PageABuilder.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 21.02.21.
//

import Foundation
import UIKit

final class PageABuilder {
    
    public func build() -> UIViewController {
        let router = PageARouterImpl()
        let interactor = PageAInteractor(dataProvider: GithubUserDataProvider.shared)
        let presenter = PageAPresenterImpl(router: router, interactor: interactor)
        let view = PageAViewController(presenter: presenter)
        
        router.viewController = view
        interactor.output = presenter
        return view
    }
}