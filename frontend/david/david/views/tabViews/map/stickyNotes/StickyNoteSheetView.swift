//
//  SheetView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

///The Sheet
struct StickyNoteSheetView: View {
    

    public var mockNotes = [
        NoteStruct(note_title: "My favourite place", note_description: "This is my favourite place in the world, because this is where I have met my boyfriend. We went to a really nice restaurant and ate some very special food", note_location_latitude: "11.669046 48.262034", note_location_longitude: "11.670845 48.265421", note_category: "happy", note_created_at: "23.06.2022", note_author: "Sarah"),
        NoteStruct(note_title: "Great place for halloween", note_description: "Me and my friends always used to tell each other scary stories at this place here. I was so scared", note_location_latitude: "34.43245", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "23.04.2022", note_author: "scaredPerson"),
        NoteStruct(note_title: "Amazing nature", note_description: "As a student I always used to go on a hike at this place. Oh I miss these days", note_location_latitude: "34.43245", note_location_longitude: "11.669046 48.262034", note_category: "bdknle", note_created_at: "25.04.2012", note_author: "Hiker Mike"),
        NoteStruct(note_title: "Cheap Food", note_description: "As a kis I always used to get the cheapest food here!", note_location_latitude: "11.669046 48.262034", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "15.04.2015", note_author: "Tony")
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(mockNotes) { note in
                StickyNote(note: note)
                    .padding(15)
            }
            .padding(20)
            .padding(.bottom, 10)
        }
        .background(Color.clear)
    }
}

struct StickyNoteSheetView_Previews: PreviewProvider {
    static var previews: some View {
        StickyNoteSheetView()
    }
}
