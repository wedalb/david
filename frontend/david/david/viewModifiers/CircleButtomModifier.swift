//
//  CircleButtomModifier.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import Foundation
import SwiftUI

/// This Viewmodifier is for the buttons that you can see when you open the app. The cameraview Button and the Preferences Button
struct CircleButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(
                ZStack{
                    Circle()
                        .fill(.black)
                        .opacity(0.7)
                        .frame(width: 60, height: 60, alignment: .top)
                        .shadow(radius: 3)
                    
                }
            )
    }
}
