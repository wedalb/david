//
//  MapButton.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import SwiftUI

struct MapButton: View {
    var body: some View {
        NavigationView {
            ZStack {
                MapView()
                HStack {
                    Spacer().frame(width: UIScreen.main.bounds.width-80, height: 36.0, alignment: .topLeading)
                    NavigationLink(destination: CreateNoteView()) {
                        Image(systemName: "plus")
                            .modifier(CircleButtonModifier())
                            .padding(100)
                    }
                    .navigationBarHidden(true).frame(maxHeight: .infinity, alignment: .top)
                }
            }
        }
    }
}
struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton()
    }
}

