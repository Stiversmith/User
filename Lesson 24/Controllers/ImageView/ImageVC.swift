//
//  ImageVC.swift
//  Lesson 24
//
//  Created by Aliaksandr Yashchuk on 10/9/23.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    
    private let imageURL = "https://w.forfun.com/fetch/4c/4c3361784e34e32404cbc5d1e183f5bb.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchImage()
        // Do any additional setup after loading the view.
    }
    private func fetchImage() {
        
        guard let url = URL(string: imageURL) else {return}
        
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            print(data)
            print(response)
            print(error)
            DispatchQueue.main.async {
                
                self?.activityIndic.stopAnimating()
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let response = response {
                    print(response)
                }
                
                if let data = data,
                   let image = UIImage(data: data){
                    self?.imageView.image = image
                } else {
                    
                }
            }
        }
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
