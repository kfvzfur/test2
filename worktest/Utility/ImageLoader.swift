//
//  ImageLoader.swift
//  worktest
//
//  Created by kfvz on 2022/5/27.
//

import Combine
import UIKit
class ImageLoader: ObservableObject {
    // #2
    @Published var downloadedImage: UIImage?
               
    func load(url: String) {
        guard let url = URL(string: url) else {
            print("Invalid url.")
            return
        }
                                
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, let _ = response else {
                print("No data or response.")
                return
            }
               
            // #3
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
        }
        
        task.resume()
    }
}

