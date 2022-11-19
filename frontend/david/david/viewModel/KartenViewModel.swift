//
//  KartenView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

//
//  ContentViewModel.swift
//  hackaTUM_UserLocation
//
//  Created by Hannes Wagner on 19.11.22.
//
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 48.150297, longitude: 11.575974)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
}

final class KartenViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
        @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                                   span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show an alert letting them know this is off and to go turn it on.")
        }
    }
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted likely due to parental contriols.")
            case .denied:
                print("Your have denied this app location permission. Go into settings to change it.")
            case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultSpan)
            @unknown default:
                break
        }

    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
