//
//  Proxy.swift
//  Proxy
//
//  Created by Марк Фокша on 11.05.2023.
//

import Foundation

var cacheData: Data?

class Proxy: LoadDataProtocol {
    private var service: LoadDataProtocol
    
    init(service: LoadDataProtocol) {
        self.service = service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        if cacheData == nil {
            service.loadImage(url: url) { data, response, error in
                cacheData = data
                completion(data, response, error)
            }
        } else {
            completion(cacheData, nil, nil)
        }
    }
    
    
}
