//: # UIKit Dynamics
//: [Previous](@previous) | [Next](@next)

import UIKit
import XCPlayground

let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
view.backgroundColor = UIColor.whiteColor()

let nameTextField = UITextField(frame: CGRect(x: 20, y: -20, width: 280, height: 30))
nameTextField.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
nameTextField.placeholder = "Username"
view.addSubview(nameTextField)

let passwordTextField = UITextField(frame: CGRect(x: 20, y: -20, width: 280, height: 30))
passwordTextField.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
passwordTextField.placeholder = "Password"
view.addSubview(passwordTextField)

let button = UIButton(type: .System)
button.frame = CGRect(x: 20, y: -20, width: 280, height: 40)
button.backgroundColor = UIColor.blueColor()
button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
button.setTitle("Login", forState: .Normal)
view.addSubview(button)

let animator = UIDynamicAnimator(referenceView: view)

let gravity = UIGravityBehavior(items: [nameTextField, passwordTextField, button])
animator.addBehavior(gravity)

let leftAnchor = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//leftAnchor.backgroundColor = UIColor.redColor()
view.addSubview(leftAnchor)

let leftAnchorAttachment = UIAttachmentBehavior(item: leftAnchor, attachedToAnchor: view.frame.origin)
animator.addBehavior(leftAnchorAttachment)

let attachmentLeft = UIAttachmentBehavior.limitAttachmentWithItem(nameTextField, offsetFromCenter: UIOffset(horizontal: nameTextField.frame.size.width/2, vertical: nameTextField.frame.size.height/2), attachedToItem: leftAnchor, offsetFromCenter: UIOffset(horizontal: 0, vertical: 0))
attachmentLeft.length = 50
animator.addBehavior(attachmentLeft)

let rightAnchor = UIView(frame: CGRect(x: view.frame.size.width-10, y: 0, width: 10, height: 10))
//rightAnchor.backgroundColor = UIColor.redColor()
view.addSubview(rightAnchor)

let rightAnchorAttachment = UIAttachmentBehavior(item: rightAnchor, attachedToAnchor: CGPoint(x: view.frame.size.width, y: 0))
animator.addBehavior(rightAnchorAttachment)

let attachmentRight = UIAttachmentBehavior.limitAttachmentWithItem(nameTextField, offsetFromCenter: UIOffset(horizontal: -nameTextField.frame.size.width/2, vertical: nameTextField.frame.size.height/2), attachedToItem: rightAnchor, offsetFromCenter: UIOffset(horizontal: 0, vertical: 0))
attachmentRight.length = 50
animator.addBehavior(attachmentRight)

let textFieldAttachmentLeft = UIAttachmentBehavior.limitAttachmentWithItem(nameTextField, offsetFromCenter: UIOffset(horizontal: nameTextField.frame.size.width/2, vertical: -nameTextField.frame.size.height/2), attachedToItem: passwordTextField, offsetFromCenter: UIOffset(horizontal: passwordTextField.frame.size.width/2, vertical: passwordTextField.frame.size.height/2))
textFieldAttachmentLeft.length = 10
animator.addBehavior(textFieldAttachmentLeft)

let textFieldAttachmentRight = UIAttachmentBehavior.limitAttachmentWithItem(nameTextField, offsetFromCenter: UIOffset(horizontal: -nameTextField.frame.size.width/2, vertical: -nameTextField.frame.size.height/2), attachedToItem: passwordTextField, offsetFromCenter: UIOffset(horizontal: -passwordTextField.frame.size.width/2, vertical: passwordTextField.frame.size.height/2))
textFieldAttachmentRight.length = 10
animator.addBehavior(textFieldAttachmentRight)

let buttonAttachmentLeft = UIAttachmentBehavior.limitAttachmentWithItem(passwordTextField, offsetFromCenter: UIOffset(horizontal: passwordTextField.frame.size.width/2, vertical: -passwordTextField.frame.size.height/2), attachedToItem: button, offsetFromCenter: UIOffset(horizontal: button.frame.size.width/2, vertical: button.frame.size.height/2))
buttonAttachmentLeft.length = 20
animator.addBehavior(buttonAttachmentLeft)

let buttonAttachmentRight = UIAttachmentBehavior.limitAttachmentWithItem(passwordTextField, offsetFromCenter: UIOffset(horizontal: -passwordTextField.frame.size.width/2, vertical: -passwordTextField.frame.size.height/2), attachedToItem: button, offsetFromCenter: UIOffset(horizontal: -button.frame.size.width/2, vertical: button.frame.size.height/2))
buttonAttachmentRight.length = 20
animator.addBehavior(buttonAttachmentRight)

XCPlaygroundPage.currentPage.liveView = view

//: [Previous](@previous) | [Next](@next)
