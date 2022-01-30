//
//  NavigationView.swift
//  Mapbox Navigation Attempt 2
//
//  Created by Arshmeet Sodhi on 1/26/22.
//
import SwiftUI
import CoreLocation
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections

struct NavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> NavigationView.Coordinator {
        Coordinator(self)
    }
    
    let origin = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.9131752, longitude: -77.0324047), coordinateAccuracy: 20, name: "Mapbox")
    let destination = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), coordinateAccuracy: 20, name: "White House")

            
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationView>) -> NavigationViewController {
        let routeOptions = NavigationRouteOptions(waypoints: [origin, destination], profileIdentifier: .automobile)
        var routeResponse: RouteResponse?
        
        Directions.shared.calculate(routeOptions) { session, result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case.success(let response):
                // Pass the first generated route to the navigationViewController
                routeResponse.self = response
            }
        }
        
        
        let navigationViewController = NavigationViewController(for: routeResponse!, routeIndex: 0, routeOptions: routeOptions)
        navigationViewController.delegate = context.coordinator
        navigationViewController.modalPresentationStyle = .fullScreen
        return navigationViewController
    }
    
    func updateUIViewController(_ uiViewController: NavigationViewController, context: UIViewControllerRepresentableContext<NavigationView>) {
        // do nothing
    }
    
    class Coordinator: NSObject, NavigationViewControllerDelegate {
        var control: NavigationView
        
        init(_ control: NavigationView) {
            self.control = control
        }
    }
}
