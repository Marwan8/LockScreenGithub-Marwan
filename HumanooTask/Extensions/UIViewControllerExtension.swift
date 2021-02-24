//
//  UIViewControllerExtension.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 23.02.21.
//

import UIKit.UIAlertController

//localization
prefix operator &&

prefix func && (string: String?) -> String {
    guard let string = string else { return "" }
    return NSLocalizedString(string, comment: "")
}

extension UIViewController {

    func showAlert(_ title: String, message: String = "", okBlock: (() -> Void)? = nil, cancel: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: &&"OK", style: .default) { _ in
            okBlock?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
