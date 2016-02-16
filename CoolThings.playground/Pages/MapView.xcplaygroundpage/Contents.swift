//: # MapView
//: [Previous](@previous) | [Next](@next)

import UIKit
import MapKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution

let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
XCPlaygroundPage.currentPage.liveView = mapView

let geoCoder = CLGeocoder()
geoCoder.geocodeAddressString("Maastrichter Straße 45, 50672 Köln") { (placemarks, error) in
  
  if let placemark = placemarks?.first, coordinate = placemark.location?.coordinate {
    
    let region = MKCoordinateRegionMakeWithDistance(coordinate, 400, 400)
    mapView.setRegion(region, animated: true)
    
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    label.text = "\(placemark.name!)\n\(coordinate.latitude), \(coordinate.longitude)"
//    label.backgroundColor = [#Color(colorLiteralRed: 0.1956433057785034, green: 0.2113749980926514, blue: 0.2356699705123901, alpha: 1)#].colorWithAlphaComponent(0.6)
//    label.textColor = [#Color(colorLiteralRed: 1, green: 0.9999743700027466, blue: 0.9999912977218628, alpha: 1)#]
//    label.numberOfLines = 0
//    mapView.addSubview(label)
//    
//    label.topAnchor.constraintEqualToAnchor(mapView.topAnchor).active = true
    
    let meeting = Meeting(coordinate: coordinate, title: "Cocoaheads Köln", subtitle: "\(coordinate.latitude), \(coordinate.longitude)")
    mapView.addAnnotation(meeting)
  }
  
}

//: [Previous](@previous) | [Next](@next)
