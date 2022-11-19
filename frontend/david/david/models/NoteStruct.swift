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
public struct NoteStruct: Decodable, Identifiable, Hashable {
    
    public var id = UUID()
    public var note_title,
        note_description,
        note_location_latitude,
        note_location_longitude,
        note_category,
        note_created_at,
        note_author,
        note_building: String
    

}



