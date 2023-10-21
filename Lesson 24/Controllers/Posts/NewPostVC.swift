
import UIKit
import SwiftyJSON
import Alamofire

class NewPostVC: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTV: UITextView!
   
    var user: User?

    @IBAction func postUrl() {
        if let userId = user?.id,
           let title = titleTF.text,
           let body = bodyTV.text,
           let url = ApiConstans.postsURL {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let postBodyJSON: [String: Any] = [
                "userId": userId,
                "title": title,
                "body": body
            ]
            
            let httpBody = try? JSONSerialization.data(withJSONObject: postBodyJSON)
            request.httpBody = httpBody
            
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                print(response)
                if let data = data {
                    let json = JSON(data)
                    let userId = json["userId"]
                    let title = json["title"]
                    let body = json["body"]
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
            }.resume()
            
        }
    }
    
    @IBAction func postAlam() {
        if let userId = user?.id,
           let title = titleTF.text,
           let body = bodyTV.text,
           let url = ApiConstans.postsURL {
            
            let parameters: Parameters = [
                "userId": userId,
                "title": title,
                "body": body
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .response { [weak self] response in
                    debugPrint(response)
                    print(response.request)
                    print(response.response)
                    debugPrint(response.result)
                    
                    switch response.result {
                    case .success(let data):
                        print(data)
                        print(JSON(data))
                        self?.navigationController?.popViewController(animated: true)
                    case .failure(let error):
                        print(error)
                        
                    }
                }
        }
    }
}
