//  
//  PageBBuilder.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 23.02.21.
//

import Foundation
import UIKit

final class PageBBuilder {
    
    public func build(user: GithubUser?) -> UIViewController {
        let router = PageBRouterImpl()
        let presenter = PageBPresenterImpl(router: router, user: user)
        let view = PageBViewController(presenter: presenter)
        
        router.viewController = view
        return view
    }
    
}
