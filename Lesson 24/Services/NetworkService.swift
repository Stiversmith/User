
import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class NetworkService {
    static func deletePost(postId: Int, callback: @escaping () -> ()) {
        let urlPath = "\(ApiConstans.postsURL)/\(postId)"
            AF.request(urlPath, method: .delete, encoding: JSONEncoding.default)
            .response { response in
                callback()
        }
    }
}
