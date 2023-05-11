//
//  LoadData.swift
//  Proxy
//
//  Created by Марк Фокша on 11.05.2023.
//

import Foundation

class LoadData: LoadDataProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil
        
        let urlSession = URLSession(configuration: config)
        urlSession.dataTask(with: url, completionHandler: completion).resume()
    }
}
