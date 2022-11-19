//
//  TitleModifier.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//


import SwiftUI

/// Modifies the title of a section
public struct TitleModifier: ViewModifier {
    public func body(content: Content) -> some View  {
        content
            .font(Font.custom("KohSantepheap-Regular", size: 20.0))
            .bold()
            .foregroundColor(.textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            
    }
}

/// Modifies the title of a section
public struct TitleModifierNotes: ViewModifier {
    public func body(content: Content) -> some View  {
        content
            .font(Font.custom("KohSantepheap-Regular", size: 20.0))
            .bold()
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            
    }
}
