//: # Auto Layout
//: [Previous](@previous) | [Next](@next)

import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
view.backgroundColor = [#Color(colorLiteralRed: 0.7602152824401855, green: 0.7601925134658813, blue: 0.7602053880691528, alpha: 1)#]

let makeViewWithColor = { (color: UIColor) -> UIView in
  let view = UIView()
  view.translatesAutoresizingMaskIntoConstraints = false
  view.backgroundColor = color
  return view
}

let blueView = makeViewWithColor([#Color(colorLiteralRed: 0.1991284191608429, green: 0.6028449535369873, blue: 0.9592232704162598, alpha: 1)#])
view.addSubview(blueView)

let redView = makeViewWithColor([#Color(colorLiteralRed: 0.7540004253387451, green: 0, blue: 0.2649998068809509, alpha: 1)#])
view.addSubview(redView)

let greenView = makeViewWithColor([#Color(colorLiteralRed: 0.4028071761131287, green: 0.7315050363540649, blue: 0.2071235477924347, alpha: 1)#])
view.addSubview(greenView)

let views = ["blue": blueView, "red": redView, "green": greenView]
var layoutConstraints = [NSLayoutConstraint]()
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-[blue(red)]-[red]-|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[blue(green)]-[green]-|", options: [.AlignAllLeading], metrics: nil, views: views)
layoutConstraints.append(greenView.trailingAnchor.constraintEqualToAnchor(redView.trailingAnchor))
NSLayoutConstraint.activateConstraints(layoutConstraints)

XCPlaygroundPage.currentPage.liveView = view

//: [Previous](@previous) | [Next](@next)
