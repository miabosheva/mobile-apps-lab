import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var restaurantMap: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant Location"
        cityLabel.text = "Skopje"
        temperatureLabel.text = "Temperature: N/A"
        locationManager.requestWhenInUseAuthorization()
        setupMap()
    }
    
    func setupMap() {
        guard (locationManager.location != nil) else { return }
        let initialLocation = locationManager.location!
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        restaurantMap.setRegion(coordinateRegion, animated: true)
        Task { @MainActor in
            do {
                let temp = try await ForecastModel.getForecastForCoordinates(city: "Skopje").temp
                temperatureLabel.text = "Temperature: \(temp)"
            } catch {
                print("error fetching temp")
            }
        }
    }
}
