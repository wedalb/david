//
//  Note.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import Foundation
import SwiftUI
import CoreLocation

/// A struct for a Note that a User can create. This structure also follows the same structure as the Database table
public struct Note: Codable, Identifiable, Hashable {
    
    public var id = UUID()
    public var title,
        description,
        latitude,
        longitude,
        created_at,
        author,
        ranking: String
    

    
    // initialize an empty note
    init(title: String,
         description: String,
         latitude: String,
         longitude: String,
         created_at: String,
         author: String){
        
        self.title = title
        self.longitude = longitude
        self.latitude = latitude
        self.description = description
        self.author = author
        self.created_at = created_at
        self.id = UUID()
        self.ranking = "0.0"
        let settings = UserSettingsManager.settings.getSettings()
        self.author = settings.firstName + settings.lastName
    
    }
    
    init(){
        self.title = "no title"
        self.longitude = "23.03"
        self.latitude = "13.203"
        self.description = "kdndjndknd"
        self.created_at = "23.02.2000"
        self.ranking = "0.0"
        self.author = "none"
    }
    
    
    

}



