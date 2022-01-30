//
//  ContentView.swift
//  Mapbox Navigation Attempt 2
//
//  Created by Arshmeet Sodhi on 1/25/22.
//

import SwiftUI

struct ContentView: View {
    @State var presentingModal = false
    
    var body: some View {
        ZStack {
            MapBoxMapView()
                .ignoresSafeArea()
            Button("Present") {
                self.presentingModal = true
            }
            .sheet(isPresented: $presentingModal) {
                NavigationView(presentedAsModal: self.$presentingModal)
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
