//
//  ProfilePictureModifier.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI
/// modifies a profile picture
extension Image {
    func profilePictureModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(color: .accentColor, radius: 20.0)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
    }
}


