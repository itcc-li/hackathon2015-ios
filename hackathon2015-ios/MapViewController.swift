//
//  MapViewController.swift
//  hackathon2015-ios
//
//  Created by Simon Meier on 12/09/15.
//  Copyright (c) 2015 itcc. All rights reserved.
//

import Foundation
import MapKit

class MapViewController : UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var currLongitude : Double = 0
    var currLatitude : Double = 0
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        let authorizationStatus : CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == CLAuthorizationStatus.AuthorizedWhenInUse ||
            authorizationStatus == CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation()
                mapView.showsUserLocation = true
        }
        mapView.delegate = self
        mapView.showsPointsOfInterest = true
        mapView.showsBuildings = true
        showData()
    }
    
    func showData() {
        let appDelegate : AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        for(var i=0; i < appDelegate.poisData.count; i++) {
            let currPoi = appDelegate.poisData[i]
            var ctrpoint : CLLocationCoordinate2D = CLLocationCoordinate2D()
            ctrpoint.latitude = Double(currPoi.latitude!)
            ctrpoint.longitude = Double(currPoi.longitude!)
            let annotation : MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = ctrpoint
            annotation.title = currPoi.name
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse ||
            status == CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation()
                mapView.showsUserLocation = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Couldn't get your location")
    }
    
    /*
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if view.isKindOfClass(MKUserLocation) {
            println(annotation.title)
            //annotation.title = "Add entry"
            //return nil to use default blue dot view
        }
        return MKAnnotationView()

    }*/
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if view.annotation.title == "Current Location" {
            currLongitude = view.annotation.coordinate.longitude
            currLatitude = view.annotation.coordinate.latitude
            performSegueWithIdentifier("addDetailFromMap", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addDetailFromMap" {
            let addEntryController : AddEntryController = segue.destinationViewController as! AddEntryController
            addEntryController.longitude = currLongitude
            addEntryController.latitude = currLatitude
        }
    }
}