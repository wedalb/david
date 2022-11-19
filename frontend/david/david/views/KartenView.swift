//
//  ContentView.swift
//  hackaTUM_UserLocation
//
//  Created by Hannes Wagner on 19.11.22.
//

import MapKit
import SwiftUI

struct KartenView: View {
    @StateObject private var viewModel = KartenViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct KartenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

