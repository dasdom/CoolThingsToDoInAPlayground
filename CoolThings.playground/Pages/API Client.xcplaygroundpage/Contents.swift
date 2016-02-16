//: # API Client
//: [Previous](@previous) | [Next](@next)

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

enum APIClientError: ErrorType {
  case DataNil
  case JSONNotDictionary
}

struct APIClient {
  
  static let baseURLString = "https://api.github.com"
  
  static func fetchUser(name: String, completion: (user: User?, error: ErrorType?) -> Void) {
    guard let url = NSURL(string: "\(baseURLString)/users/\(name)") else { fatalError() }
    
    NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
      var outputError: ErrorType? = error
      var user: User?
      
      defer {
        completion(user: user, error: outputError)
      }
      
      do {
        let rawDict = try dictFromFromData(data)
        if let name = rawDict["name"] as? String,
          avatarURLString = rawDict["avatar_url"] as? String,
          avatarURL = NSURL(string: avatarURLString) {
          
          user = User(name: name, avatarURL: avatarURL)
        }
      } catch {
        outputError = error
      }
      }.resume()
  }
  
  static func avatarFor(user: User, completion: (image: UIImage?, error: ErrorType?) -> Void) {
    NSURLSession.sharedSession().dataTaskWithURL(user.avatarURL) { (data, response, error) in
      var outputError = error
      var image: UIImage?
      
      defer {
        completion(image: image, error: outputError)
      }
      
      if let data = data {
        image = UIImage(data: data)
        XCPlaygroundPage.currentPage.finishExecution()
      }
    }.resume()
  }
  
  
  static func dictFromFromData(data: NSData?) throws -> [String: AnyObject] {
    guard let data = data else { throw APIClientError.DataNil }
    
    guard let rawDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject] else {
      throw APIClientError.JSONNotDictionary
    }
    return rawDict
  }
}

APIClient.fetchUser("mkalmes") { (user, error) in
  guard let user = user else { return }
  APIClient.avatarFor(user) { (image, error) in
    guard let image = image else { return }
    dispatch_async(dispatch_get_main_queue(), {
      let imageView = UIImageView(image: image)
      XCPlaygroundPage.currentPage.liveView = imageView
    })
  }
}

//: [Previous](@previous) | [Next](@next)
