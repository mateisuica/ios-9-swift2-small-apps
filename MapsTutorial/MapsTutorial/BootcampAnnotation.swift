//
//  BootcampAnnotation.swift
//  MapsTutorial
//
//  Created by Matei Suica on 26/06/16.
//  Copyright © 2016 Matei Suica. All rights reserved.
//

import Foundation
import MapKit

class BootcampAnnotation: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}