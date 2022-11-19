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
                                   SheetView()
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
        Note(name: "Siegestor", coordinate: CLLocationCoordinate2D(latitude: 48.152337, longitude: 11.582165)),
        Note(name: "Alte Pinakothek", coordinate: CLLocationCoordinate2D(latitude: 48.148271, longitude: 11.569977)),
    ]
    
}

struct KartenView_Previews: PreviewProvider {
    static var previews: some View {
        KartenView()
    }
}


///The Sheet
struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)

    }
}
