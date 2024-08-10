//
//  CoreLocationManager.swift
//  Ae-shley
//
//  Created by Seo-Jooyoung on 8/11/24.
//

import Foundation
import CoreLocation
import Combine

class CoreLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    @Published var address: String?
    @Published var errorMessage: String?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func checkLocationAuthorization() {
        locationManagerDidChangeAuthorization(locationManager)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("denied")
            errorMessage = "Location access denied or restricted."
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default:
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastKnownLocation = location.coordinate
        
        reverseGeocodeLocation(location)

        print(location.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("didFailedWithError")
        errorMessage = "Failed to get location: \(error.localizedDescription)"
    }
    
    private func reverseGeocodeLocation(_ location: CLLocation) {
        
        let locale = Locale(identifier: "en_US")
        geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { [weak self] placemarks, error in
            if let error = error {
                print("Reverse geocoding failed with error: \(error.localizedDescription)")
                self?.errorMessage = "Failed to get address: \(error.localizedDescription)"
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found")
                self?.address = "No address found"
                return
            }
            
            // 도로명 주소를 자세히 추출하고 업데이트합니다.
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            let city = placemark.locality ?? ""
            let state = placemark.administrativeArea ?? ""
            
            // 모든 주소 요소를 조합하여 완전한 주소를 만듭니다.
            var fullAddress = ""
            
            if !streetNumber.isEmpty {
                fullAddress += "\(streetNumber) "
            }
            
            if !streetName.isEmpty {
                fullAddress += "\(streetName), "
            }
            
            if !city.isEmpty {
                fullAddress += "\(city), "
            }
            
            if !state.isEmpty {
                fullAddress += "\(state) "
            }
            
            
            // 공백과 쉼표가 있는 경우 제거
            self?.address = fullAddress.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: ", $", with: "")
        }
    }
}
