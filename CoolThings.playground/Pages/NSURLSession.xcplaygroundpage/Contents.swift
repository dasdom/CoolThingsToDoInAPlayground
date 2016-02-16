//: # NSURLSession
//: [Previous](@previous) | [Next](@next)

import UIKit
import XCPlayground

let user = "dasdom"

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let urlString = "https://api.github.com/users/\(user)"
let url = NSURL(string: urlString)!

let session = NSURLSession.sharedSession()
session.dataTaskWithURL(url) { (data, _, _) in
  
  let dict = try? NSJSONSerialization.JSONObjectWithData(data!, options: [])
  
  print(dict)
  
  if let avatar = dict?["avatar_url"] as? String {
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: avatar)!, completionHandler: { (data, _, _) in
      dispatch_async(dispatch_get_main_queue(), {
        let image = UIImage(data: data!)
        let imageView = UIImageView(image: image)
        XCPlaygroundPage.currentPage.liveView = imageView
      })
      
    }).resume()
  }
  
//  XCPlaygroundPage.currentPage.finishExecution()
}.resume()

//: [Previous](@previous) | [Next](@next)
