//
//  ListComponent.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//


import SwiftUI

struct ListComponent: View {
    var text: String
    var description: String
    var body: some View {
        Grid{
            GridRow{
                Image("testImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 20.0)
                    
            }
        }
        
        VStack{
            Text(text)
                .modifier(TextModifier())
            Text(description)
                .modifier(DescriptionModifier())
        }
    }
}

struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(text: "Text", description: "description")
    }
}
