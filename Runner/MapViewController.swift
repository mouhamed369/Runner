//
//  MapViewController.swift
//  Runner
//
//  Created by MED YASSINE MESSAOUD on 16/3/2023.
//

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController  , CLLocationManagerDelegate , MKMapViewDelegate{
    
    
    
    @IBOutlet weak var btnGetDirections: UIButton!
    @IBOutlet weak var mapview: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapview.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapview.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled(){
            checkAuthorization()
            
            
        }else{
           print("Location service is not enabled")
        }
    }
   // func isLocationServiceEnabled() -> Bool {
    //if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // Invoke the method here
            //locationManager.startUpdatingLocation()
       // } else {
            // Handle the case where the user has not authorized location services
           // return CLLocationManager.locationServicesEnabled()

       // }
    //return false

   // }
    @IBAction func btnGetDirections(_ sender: Any) {
        if let userLoc = locationManager.location{
            drawDirections(startingLoc : userLoc.coordinate, destinationLoc: mapview.centerCoordinate)
        }
    }
    func checkAuthorization(){
        switch locationManager.authorizationStatus {
        case.notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case.authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            break
            
        case.authorizedAlways:
            locationManager.startUpdatingLocation()
           
            break
        case.denied:
           print( "Please authorize access to location")
            break
        case.restricted:
            print( "Authorization restricted")
            break
        
        default:
            print("default..")
            
            break
            
            
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
            
            zoomToUseerLocation(location: location)
        
            
        
    }
    func zoomToUseerLocation(location : CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: 500,longitudinalMeters: 500)
        mapview.setRegion(region, animated: true)
    }
   /* func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        
        case.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapview.showsUserLocation = true
            
            break
            
        case.authorizedAlways:
            locationManager.startUpdatingLocation()
            mapview.showsUserLocation = true
            break
        
        case.denied:
            showAlert(msg: "Please authorize access to location")
            break
        default:
            print("default..")
            
            break
            
            
            
        }
       }
        
    */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
 
            
            break
            
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
           
            break
        
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            print("please authorize app to access your location")
            break
        case .restricted:
            print("cannot access location on your app")
            break
        default:
            print("unknow case")
            
            break
            
            
            
        }
        
        
    }
    
       
    
    func showAlert(msg: String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        present(alert, animated: true,completion: nil)
    }
    func drawDirections(startingLoc : CLLocationCoordinate2D , destinationLoc: CLLocationCoordinate2D){
        let startingPlace = MKPlacemark(coordinate: startingLoc)
        let destinationPlace = MKPlacemark(coordinate: destinationLoc)
        let startingItem = MKMapItem(placemark: startingPlace)
        let destinationItem = MKMapItem(placemark: destinationPlace)
        let request = MKDirections.Request()
        request.source = startingItem
        request.destination = destinationItem
        request.transportType = .automobile
        //  request.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: request)
        directions.calculate { response , error in guard let response = response else {
            if let error = error {
                print("direction error: \(error.localizedDescription)" )
                
            }
            return
        }
            for route in response.routes{
                self.mapview.addOverlay(route.polyline)
                self.mapview.setVisibleMapRect(route.polyline.boundingMapRect, animated : true)
            }
            
        }
        
        
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay : MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render

    }
  
}
