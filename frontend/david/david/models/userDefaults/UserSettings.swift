//
//  UserSettings.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation


/// This struct describes the User Settings. For example their name, or preferences for categories
public struct UserSettings {
    var firstName: String
    var lastName: String
    var categoryPreference: Set<String>
    
}
