import Foundation

struct ApiConstans {
    
    static let serverPath = "http://localhost:3000/"
    
    static let usersPath = serverPath + "users"
    static let usersUrl = URL(string: usersPath)

    static let postsPath = serverPath + "posts"
    static let postsURL = URL(string: postsPath)
    
    static let commentsPath = serverPath + "comments"
    static let commentsURL = URL(string: commentsPath)
    
    static let albomsPath = serverPath + "albums"
    static let albomsURL = URL(string: albomsPath)
    
    static let photosPath = serverPath + "photos"
    static let photosURL = URL(string: photosPath)
}
