//
//  ContentView.swift
//  hackaTUM_UserLocation
//
//  Created by Hannes Wagner on 19.11.22.
//

import MapKit
import SwiftUI


struct Noty: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @StateObject private var viewModel = KartenViewModel()
    
    ///Showing Sheet
    @State private var showingSheet = false
    

    
    var body: some View {
//        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
        Map(coordinateRegion: $viewModel.region,showsUserLocation: true, annotationItems: annotations){
//            MapPin(coordinate: $0.coordinate)
            MapAnnotation(
               coordinate: $0.coordinate,
               content: {
                  Image("StickyNote")
                       .frame(width: 45, height: 45)
                       .clipped()
                       .shadow(radius: 5.0)
                       .onTapGesture {
                           showingSheet.toggle()
                       }
                       .sheet(isPresented: $showingSheet) {
                           StickyNoteSheetView()
                               }
//                  Text(Note.name)
               }
            )
        }
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
    
    let annotations = [
        Noty(name: "Siegestor", coordinate: CLLocationCoordinate2D(latitude: 48.152337, longitude: 11.582165)),
        Noty(name: "Alte Pinakothek", coordinate: CLLocationCoordinate2D(latitude: 48.148271, longitude: 11.569977)),
        Noty(name: "TUM", coordinate: CLLocationCoordinate2D(latitude: 48.262034, longitude: 11.569977)),
        Noty(name: "Natur", coordinate: CLLocationCoordinate2D(latitude:  48.265421, longitude: 11.669046)),
    ]
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

