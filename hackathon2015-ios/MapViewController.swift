//
//  MapViewController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import MapKit

class MapViewController : UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataManager = DataManager()
        for(var i=0; i<dataManager.getData().count; i++) {
            var currPoi = dataManager.getData()[i]
            var ctrpoint : CLLocationCoordinate2D = CLLocationCoordinate2D()
            ctrpoint.latitude = Double(currPoi.latitude!)
            ctrpoint.longitude = Double(currPoi.longitude!)
            var annotation : MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = ctrpoint
            annotation.title = currPoi.name
            mapView.addAnnotation(annotation)
        }
    }
}