//  
//  PageBContract.swift
//  LockScreenGithub
//
//  Created by Marwan Ayman on 23.02.21.
//

import Foundation

protocol PageBView: AnyObject {
    func showUser(name: String, imageURL: URL)
}

protocol PageBPresenter: AnyObject {
    func viewDidLoad(view: PageBView)
}

protocol PageBRouter: AnyObject {
}
