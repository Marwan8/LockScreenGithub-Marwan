//
//  UIImageViewExtension.swift
//  HumanooTask
//
//  Created by Marwan Ayman on 23.02.21.
//

import UIKit.UIImageView

extension UIImageView {

    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, placeholder: UIImage? = nil) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, placeholder: placeholder)
    }

    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, placeholder: UIImage? = nil) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                DispatchQueue.main.async {
                    self.image = placeholder
                }
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
