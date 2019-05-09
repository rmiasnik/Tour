//
//  ViewController.swift
//  Princeton Tour
//
//  Created by Ron Miasnik on 5/7/19.
//  Copyright © 2019 Ron Miasnik. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation

class ViewController: UIViewController {
    
    var sceneLocationView = SceneLocationView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sceneLocationView.run()
        
        // CHECK TO MAKE SURE I'M IN RIGHT LOCATION
        var locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()

        var currentLocation: CLLocation!

        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){

            currentLocation = locManager.location

        }

        print("\(currentLocation.coordinate.longitude)")
        print("\(currentLocation.coordinate.latitude)")
        print("\(currentLocation.altitude)")
        
        let witherspoonCoordinate = CLLocationCoordinate2D(latitude: 40.347502, longitude: -74.660147)
        let witherspoonLocation = CLLocation(coordinate: witherspoonCoordinate, altitude: 65)
        let witherspoonImage = UIImage(named: "witherspoon")!
        
        let witherspoonAnnotationNode = LocationAnnotationNode(location: witherspoonLocation, image: witherspoonImage)
        
        let holderCoordinate = CLLocationCoordinate2D(latitude: 40.348593, longitude: -74.661605)
        let holderLocation = CLLocation(coordinate: holderCoordinate, altitude: 65)
        let holderImage = UIImage(named: "holder")!
        
        let holderAnnotationNode = LocationAnnotationNode(location: holderLocation, image: holderImage)
        
        
        let blairCoordinate = CLLocationCoordinate2D(latitude: 40.347545, longitude: -74.660961)
        let blairLocation = CLLocation(coordinate: blairCoordinate, altitude: 65)
        let blairImage = UIImage(named: "blair")!
        
        let blairAnnotationNode = LocationAnnotationNode(location: blairLocation, image: blairImage)
        
        
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: witherspoonAnnotationNode)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: holderAnnotationNode)
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: blairAnnotationNode)


        view.addSubview(sceneLocationView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = view.bounds
    }


}

