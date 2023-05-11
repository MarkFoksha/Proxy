//
//  LoadDataProtocol.swift
//  Proxy
//
//  Created by Марк Фокша on 11.05.2023.
//

import Foundation

protocol LoadDataProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
