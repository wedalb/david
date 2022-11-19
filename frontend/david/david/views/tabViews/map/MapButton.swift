//
//  MapButton.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import SwiftUI

struct MapButton: View {
    var body: some View {
        ZStack {
            MapView()
            HStack {
                Spacer().frame(width: UIScreen.main.bounds.width-80, height: 36.0, alignment: .topLeading)
                Button(action: {
                }){
                    ZStack{
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.black)
                        Image(systemName: "plus")
                        //                             .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(100)
                }
                }.frame(maxHeight: .infinity, alignment: .topLeading)

            }
        }
    }
}
struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton()
    }
}

