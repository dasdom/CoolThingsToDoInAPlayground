//: # SceneKit
//: [Previous](@previous) | [Next](@next)

import UIKit
import SceneKit
import QuartzCore
import XCPlayground

var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
XCPlaygroundPage.currentPage.liveView = sceneView

let scene = SCNScene()
sceneView.scene = scene

sceneView.autoenablesDefaultLighting = true
sceneView.showsStatistics = true

let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: 0, z: 3)
scene.rootNode.addChildNode(cameraNode)

var torus = SCNTorus(ringRadius: 1, pipeRadius: 0.35)
var torusNode = SCNNode(geometry: torus)
scene.rootNode.addChildNode(torusNode)

var capsule = SCNCapsule(capRadius: 0.3, height: 1)
var capsuleNode = SCNNode(geometry: capsule)
scene.rootNode.addChildNode(capsuleNode)

torus.firstMaterial?.diffuse.contents  = UIColor.redColor()
torus.firstMaterial?.specular.contents = UIColor.whiteColor()

capsule.firstMaterial?.diffuse.contents  = UIColor.blueColor()
capsule.firstMaterial?.specular.contents = UIColor.whiteColor()

torusNode.rotation = SCNVector4(x: 1.0, y: 1.0, z: 0.0, w: 0.0)
capsuleNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 1.0, w: 0.0)

var spin = CABasicAnimation(keyPath: "rotation.w")
spin.toValue = 2.0*M_PI
spin.duration = 3
spin.repeatCount = HUGE
torusNode.addAnimation(spin, forKey: "spin torus")
capsuleNode.addAnimation(spin, forKey: "spin capsule")

//: [Source: StackOverflow](http://stackoverflow.com/a/24127282/498796)

//: [Previous](@previous) | [Next](@next)
