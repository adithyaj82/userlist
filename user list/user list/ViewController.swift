//
//  ViewController.swift
//  customPin
//
//  Created by Yash Patel on 14/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pin:AnnotationPin!
    var latitude:Double!
    var longitude:Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        print(latitude,longitude)
        let coordinate = CLLocationCoordinate2D(latitude:latitude , longitude: longitude)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
        pin = AnnotationPin(title: "address", Subtitle: "current location", coordinate: coordinate)
        mapView.addAnnotation(pin)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "tajPin")
        annotationView.image = UIImage(named: "new")
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        annotationView.transform = transform
        return annotationView
    }
}


