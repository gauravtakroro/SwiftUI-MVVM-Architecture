//
//  UIImage+Extensions.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 17/12/23.
//

import UIKit

extension UIImage {
    
    static func fromUrlWithUrlSession(url: String, completion: @escaping (UIImage?) -> Void) {
        if let urlValue = URL(string: url.trimmingCharacters(in: CharacterSet.whitespaces)) {
            let cache = URLCache.shared
            let request = URLRequest(url:urlValue, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
            if let data = cache.cachedResponse(for: request)?.data {
                print("got image from cache")
                completion(UIImage(data: data))
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            print("downloaded from internet")
                            completion(UIImage(data: data))
                        }
                    }
                }).resume()
            }
        }
    }
}

