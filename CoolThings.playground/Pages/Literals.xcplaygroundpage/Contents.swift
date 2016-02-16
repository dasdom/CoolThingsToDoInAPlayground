//: # Literals
//: [Previous](@previous) | [Next](@next)

import UIKit
import XCPlayground

/*:
 Go to `Editor/Insert Image Literal` to add an image literal like this:
 */
let imageView = UIImageView(image: [#Image(imageLiteral: "feuer.jpg")#])

let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
label.font = UIFont.systemFontOfSize(50)
label.text = "Woohoo!"
//: There are also Color Literals:
label.textColor = [#Color(colorLiteralRed: 0.7602152824401855, green: 0.7601925134658813, blue: 0.7602053880691528, alpha: 1)#]
imageView.addSubview(label)

label.centerXAnchor.constraintEqualToAnchor(imageView.centerXAnchor).active = true
label.centerYAnchor.constraintEqualToAnchor(imageView.centerYAnchor).active = true

XCPlaygroundPage.currentPage.liveView = imageView

//: [Previous](@previous) | [Next](@next)
