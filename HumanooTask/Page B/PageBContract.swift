//  
//  PageBContract.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 23.02.21.
//

import Foundation

protocol PageBView: class {
    func showUser(name: String, imageURL: URL)
}

protocol PageBPresenter: class {
    func viewDidLoad(view: PageBView)
}

protocol PageBRouter: class {
}
