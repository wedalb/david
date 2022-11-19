//
//  StickyNoteView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct StickyNoteView: View {
    public var mockNotes = [
        NoteStruct(note_title: "Mein Lieblingsort", note_description: "Hier ist mein lieblingsort", note_location_latitude: "43.234524", note_location_longitude: "23.234502", note_category: "happy", note_created_at: "23.06.2000", note_author: "Fish", note_building: "Museum"),
        NoteStruct(note_title: "Lala", note_description: "lalalalalla", note_location_latitude: "34.43245", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "23.04.2000", note_author: "lala", note_building: "lalaal")
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(mockNotes) { note in
                StickyNote(note: note)
            }
            .padding(20)
            .padding(.bottom, 10)
        }
    }
}

struct StickyNoteView_Previews: PreviewProvider {
    static var previews: some View {
        StickyNoteView()
    }
}
