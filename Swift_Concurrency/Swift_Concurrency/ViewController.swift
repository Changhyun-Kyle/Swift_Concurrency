//
//  ViewController.swift
//  Swift_Concurrency
//
//  Created by 강창현 on 1/17/24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var firstImageView: UIImageView!
    @IBOutlet private weak var secondImageView: UIImageView!
    @IBOutlet private weak var thirdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func loadImage(url: URL, imageView: UIImageView) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Debug: - URLSession Error: \(error.localizedDescription)")
                    return
                }
                if let data = data,
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }
            task.resume()
    }
    
    @IBAction private func tapFirstImageLoadButton(_ sender: UIButton) {
        let url = URL(string: "https://docs-assets.developer.apple.com/published/c7124fb5d7/bf4501ff-82b2-4dd4-9ec3-243ef0e70d21.png")!
        loadImage(url: url, imageView: firstImageView)
    }
    
    @IBAction private func tapSecondImageLoadButton(_ sender: UIButton) {
        let url = URL(string: "https://docs-assets.developer.apple.com/published/8b22355c7f/730c8e1b-654f-4eb9-9c63-d439a69ac5d2.png")!
        loadImage(url: url, imageView: secondImageView)
    }
    @IBAction private func tapThirdImageLoadButton(_ sender: UIButton) {
        let url = URL(string: "https://yagomdotnet-bucket.s3.ap-northeast-2.amazonaws.com/wp-content/uploads/2020/02/28130958/cover2_transparent-1.png")!
        loadImage(url: url, imageView: thirdImageView)
    }

}

