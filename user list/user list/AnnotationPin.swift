//
//  AnnotationPin.swift
//  customPin
//
//  Created by Yash Patel on 14/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, Subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
    }
}
