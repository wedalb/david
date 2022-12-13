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
public struct NoteStruct: Codable, Identifiable, Hashable {
    
    public var id = UUID()
    public var note_title,
        note_description,
        note_location_latitude,
        note_location_longitude,
        note_category,
        note_created_at,
        note_author : String
    
    // initialize an empty note
    init(){
        self.note_title = "No Headline sorry :/"
        self.note_description = "No description yet ;)"
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd"
        self.note_created_at = dateFormatter.string(from: Date.now)
        let settings = UserSettingsManager.settings.getSettings()
        self.note_author = settings.firstName + settings.lastName
        self.note_category = "No category"
        self.note_location_latitude = "0.0"
        self.note_location_longitude = "0.0"
    }
    
    // initialize an empty note
    init(note_title: String, note_description: String,
         note_location_latitude: String,
         note_location_longitude: String,
         note_category: String,
         note_created_at: String,
         note_author: String){
        
        self.note_title = note_title
        self.note_location_longitude = note_location_longitude
        self.note_category = note_category
        self.note_location_latitude = note_location_latitude
        self.note_description = note_description
        self.note_author = note_author
        self.note_created_at = note_created_at
        let settings = UserSettingsManager.settings.getSettings()
        self.note_author = settings.firstName + settings.lastName
     
    }
    
    
    

}



