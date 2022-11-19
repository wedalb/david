//
//  DescriptionModifier.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//



import SwiftUI

/// Modifies the standard Description
public struct DescriptionModifier: ViewModifier {
    public func body(content: Content) -> some View  {
        content
            .font(Font.custom("KohSantepheap-Thin", size: 12.0))
            .foregroundColor(.descriptionColor)
            
    }
}
