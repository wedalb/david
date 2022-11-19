//
//  ContentView.swift
//  hackaTUM_UserLocation
//
//  Created by Hannes Wagner on 19.11.22.
//

import MapKit
import SwiftUI


struct Note: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct KartenView: View {
    @StateObject private var viewModel = KartenViewModel()
    
    var body: some View {
//        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true, annotationItems: annotations){
            MapPin(coordinate: $0.coordinate)
        }
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
    
    let annotations = [
        Note(name: "Siegestor", coordinate: CLLocationCoordinate2D(latitude: 48.152337, longitude: 11.582165)),
        Note(name: "Alte Pinakothek", coordinate: CLLocationCoordinate2D(latitude: 48.148271, longitude: 11.569977)),
    ]
    
}

struct KartenView_Previews: PreviewProvider {
    static var previews: some View {
        KartenView()
    }
}
