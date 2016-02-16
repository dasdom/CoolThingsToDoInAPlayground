import Foundation

public struct User {
  let name: String
  public let avatarURL: NSURL
  
  public init(name: String, avatarURL: NSURL) {
    self.name = name
    self.avatarURL = avatarURL
  }
}