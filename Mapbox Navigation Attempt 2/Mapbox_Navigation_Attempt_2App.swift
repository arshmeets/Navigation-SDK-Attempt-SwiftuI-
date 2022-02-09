//
//  Mapbox_Navigation_Attempt_2App.swift
//  Mapbox Navigation Attempt 2
//
//  Created by Arshmeet Sodhi on 1/25/22.
//

import SwiftUI

@main
struct Mapbox_Navigation_Attempt_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
