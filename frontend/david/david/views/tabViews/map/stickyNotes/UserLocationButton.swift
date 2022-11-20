//
//  UserLocationButton.swift
//  david
//
//  Created by Hannes Wagner on 20.11.22.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct UserLocationButton: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if let location = locationManager.location {
                    Text("**Current location:** \(location.latitude), \(location.longitude)")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                Spacer()
                LocationButton {
                    locationManager.requestLocation()
                }
                .frame(width: 180, height: 40)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct UserLocationButton_Previews: PreviewProvider {
    static var previews: some View {
        UserLocationButton()
    }
}

