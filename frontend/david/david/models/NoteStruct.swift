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
public struct NoteStruct: Decodable, Identifiable {
    
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
public var mockNotes = [
    NoteStruct(note_title: "Mein Lieblingsort", note_description: "Hier ist mein lieblingsort", note_location_latitude: "43.234524", note_location_longitude: "23.234502", note_category: "happy", note_created_at: "23.06.2000", note_author: "Fish", note_building: "Museum"),
    NoteStruct(note_title: "Lala", note_description: "lalalalalla", note_location_latitude: "34.43245", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "23.04.2000", note_author: "lala", note_building: "lalaal")
]


