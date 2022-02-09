//
//  MapBoxMapView.swift
//  Mapbox Navigation Attempt 2
//
//  Created by Arshmeet Sodhi on 1/25/22.
//

import SwiftUI
import UIKit
import MapboxMaps

struct MapBoxMapView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MapViewController {
        return MapViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class MapViewController: UIViewController {
        internal var mapView: MapView!
        override public func viewDidLoad() {
            super.viewDidLoad()
            let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiYXJzaHMiLCJhIjoiY2t5Z2lpeTluMTEzcTJ2c2V0dHoxY3AzMCJ9.Dsx7kCEf0t_dQRITFEVm-A")
            
            mapView = MapView(frame: view.bounds)
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(mapView)
        }
    }
}
