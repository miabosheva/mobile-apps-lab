import UIKit
import MapKit
import CoreLocation
import Combine

class MapViewController: UIViewController {
    
    @IBOutlet weak var restaurantMap: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private var locationManager: LocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager = LocationManager()
        self.locationManager.delegate = self
        locationManager.startUpdatingLocation()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Restaurant Location"
        self.navigationController?.navigationBar.tintColor = .orange
        cityLabel.text = ""
        temperatureLabel.text = ""
    }
}

extension MapViewController: LocationManagerDelegate {
    func locationManagerDidUpdateLocation(_ locationManager: LocationManager) {
        guard let location = locationManager.location else { return }
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        restaurantMap.setRegion(coordinateRegion, animated: true)
        
        cityLabel.text = "\(locationManager.city), \(locationManager.country)"
        if let temp = locationManager.weather?.temp {
            temperatureLabel.text = "Temperature: \(temp)"
        } else {
            temperatureLabel.text = "Temperature: N/A"
        }
    }
}

protocol LocationManagerDelegate: AnyObject {
    func locationManagerDidUpdateLocation(_ locationManager: LocationManager)
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let geocoder = CLGeocoder()
    private let locationManager = CLLocationManager()
    
    @Published var city: String = "Skopje"
    @Published var country: String = "North Macedonia"
    @Published var location: CLLocation?
    @Published var weather: CurrentConditions?
    
    weak var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestLocation()
    }
    
    func fetchCity(for location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error in reverse geocoding: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemarks found")
                return
            }
            
            if let city = placemark.locality {
                DispatchQueue.main.async {
                    self.city = city
                }
            }
            
            if let country = placemark.country {
                DispatchQueue.main.async {
                    self.country = country
                }
            }
            
            if let location = placemark.location {
                DispatchQueue.main.async {
                    self.location = location
                    self.delegate?.locationManagerDidUpdateLocation(self)
                }
            }
            
            Task {
                do {
                    self.weather = try await ForecastModel.getForecastForCoordinates(city: self.city)
                    DispatchQueue.main.async {
                        self.delegate?.locationManagerDidUpdateLocation(self)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            fetchCity(for: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}
