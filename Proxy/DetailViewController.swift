//
//  DetailViewController.swift
//  Proxy
//
//  Created by Марк Фокша on 11.05.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let urlString = URL(string: "https://lh3.googleusercontent.com/p/AF1QipOnJHzIOu1VUvkTX0GKjmqK-NdgXWJEUa8m2YPd=s1360-w1360-h1020")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
        // Do any additional setup after loading the view.
    }
    
    func loadImage() {
        let imageData = LoadData()
        let proxy = Proxy(service: imageData)
        guard let url = urlString else { return }
        
        proxy.loadImage(url: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  error == nil else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        imageView.image = nil
        cacheData = nil
        
        loadImage()
    }
    
}
