//
//  TextModifier.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation
import SwiftUI


/// Modifies the standard Text
public struct TextModifier: ViewModifier {
    public func body(content: Content) -> some View  {
        content
            .font(Font.custom("KohSantepheap-Regular", size: 20.0))
            .foregroundColor(.textColor)
            
    }
}

