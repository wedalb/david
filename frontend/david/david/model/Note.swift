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
struct Note: Decodable {
    
    let id,
        note_title,
        note_description,
        location_latitude,
        location_longitude,
        note_category,
        created_at,
        author: String
}
