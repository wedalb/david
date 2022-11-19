//
//  TextComponent.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

import SwiftUI

/// Describes the Text Component that has a Text and a description underneath
struct TextComponent: View {
    var text: String
    var description: String
    var body: some View {
        
        VStack{
            Text(text)
                .modifier(TextModifier())
            Text(description)
                .modifier(DescriptionModifier())
        }
    }
}

