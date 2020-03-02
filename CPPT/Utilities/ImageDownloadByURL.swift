//
//  ImageDownloadByURL.swift
//  CPPT
//
//  Created by omrobbie on 02/03/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

extension UIImageView {

    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }

    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: url), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
