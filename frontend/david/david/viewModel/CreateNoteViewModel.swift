//
//  CreateNoteViewModel.swift
//  david
//
//  Created by Heidi Albarazi on 20.11.22.
//

import SwiftUI
import Foundation
import Supabase


/// A viewmodel to load a list of notes from the server
public class CreateNoteViewModel : ObservableObject {
     
    // That way we connect to supabase where our table is stored
    lazy var client = SupabaseClient(supabaseURL: URL(string: "https://jodkgsfhjztbcgmcndti.supabase.co")!,
                                     supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvZGtnc2Zoanp0YmNnbWNuZHRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg4NTM4NTUsImV4cCI6MTk4NDQyOTg1NX0.mTSLfxdVGoZ5EAMG8Dygnn89SdA3hlOm2DGwGYr7SiQ")
    
    
    // newly created notes go here
    /*
    @Published var notes: [NoteStruct] = []
    @Published var createdNote: NoteStruct = NoteStruct()*/
    
    /// function that creates a new Note. Will be used to store notes that users set.
    func createNote(note_title: String, note_description: String,
                     note_location_latitude: String,
                     note_location_longitude: String,
                     note_created_at: String,
                     note_author: String) {
        
        // make a new note
        let note = Note(title: note_title,
                              description: note_description,
                              latitude: note_location_latitude,
                              longitude: note_location_longitude,
                              created_at: note_created_at,
                              author: note_author)
        
        // note as json
        guard let dictionary = try? encode(note: note) else {return}
        
        // sql query to insert a new Note into the table
        let query = client
            .database
            .from("notes_table")
            .insert(values: note)
        
    }
    
    /// Encoder to make a json out of our files
    private func encode(note: Note) throws -> Any { // Supabase needs Any
        guard
            let data = try? JSONEncoder().encode(note),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        else {
            print("Error Encoding Notes")
            throw NSError()
        }
        return dictionary
    }
    
    
    

    


}

