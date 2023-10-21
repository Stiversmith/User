
import UIKit
import MapKit

class MapViewController: UIViewController {

    var location: CLLocationCoordinate2D!
       
       @IBOutlet weak var mapView: MKMapView!
       
       override func viewDidLoad() {
           super.viewDidLoad()

           let annotation = MKPointAnnotation()
           annotation.coordinate = location
           mapView.addAnnotation(annotation)
           
           let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
           mapView.setRegion(region, animated: true)
       }

}
