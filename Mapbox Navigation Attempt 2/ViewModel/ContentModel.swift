//
//  ContentModel.swift
//  Mapbox Navigation Attempt 2
//
//  Created by Arshmeet Sodhi on 2/8/22.
//

import Foundation
import CoreLocation
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections
import SwiftUI


class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    let origin = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.9131752, longitude: -77.0324047), coordinateAccuracy: 20, name: "Mapbox")
    let destination = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), coordinateAccuracy: 20, name: "White House")
    
    
    var routeOptions: NavigationRouteOptions?
    var routeResponse: RouteResponse?
    
    func setRoute() {
        routeOptions = NavigationRouteOptions(waypoints: [origin, destination], profileIdentifier: .automobile)
        
         Directions.shared.calculate(routeOptions!) { session, result in
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                self.routeResponse = response
                
                print("sucess")
            }
        }
    }
    
}
