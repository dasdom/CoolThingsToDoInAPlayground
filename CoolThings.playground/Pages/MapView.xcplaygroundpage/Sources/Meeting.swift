import Foundation
import MapKit

public class Meeting: NSObject, MKAnnotation {
  public let coordinate: CLLocationCoordinate2D
  public let title: String?
  public let subtitle: String?
  
  public init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
    self.coordinate = coordinate
    self.title = title
    self.subtitle = subtitle
    super.init()
  }
}