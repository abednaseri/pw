//
//  DownloadImages.swift
//  pw
//
//  Created by Abed Naseri Douraki on 07.07.17.
//  Copyright © 2017 Abed Naseri Douraki. All rights reserved.
//

//
// This file is an extension for downloading Images from a given URL
//
//
//


import UIKit

extension UIImageView {
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}
