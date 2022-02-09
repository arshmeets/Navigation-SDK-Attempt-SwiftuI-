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
    @EnvironmentObject var model: ContentModel
     
    func makeCoordinator() -> NavigationView.Coordinator {
        Coordinator(self)
    }
            
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationView>) -> NavigationViewController {
        model.setRoute()
        
        
        let navigationViewController = NavigationViewController(for: model.routeResponse!, routeIndex: 0, routeOptions: model.routeOptions!)
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
