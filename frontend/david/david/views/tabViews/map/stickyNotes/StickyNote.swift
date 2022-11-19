//
//  VCard.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//
import SwiftUI

struct StickyNote: View {
    var note: NoteStruct

    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(note.note_title)
                    .modifier(TitleModifierNotes())
                    .frame(maxWidth: 170, alignment: .leading)
                    .layoutPriority(1)
                
                Text(note.note_description)
                    .modifier(TextModifierNotes())
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack{
                    Text("created on: " + note.note_created_at)
                        .modifier(DescriptionModifierNotes())
                    Text("by: " + note.note_author)
                        .modifier(DescriptionModifierNotes())
                }
            }
            .foregroundColor(Color.clear)
            .padding(30)
            .frame(width: UIScreen.screenWidth - 50, height: UIScreen.screenWidth )
            .background(Color.yellowNotes)
            .mask(RoundedRectangle(cornerRadius: 5, style: .continuous))
            .shadow(radius: 4, x: -1, y: 5)
     //       .shadow(radius: 2, x: 0, y: 1)
        }
    
}

struct StickyNote_Previews: PreviewProvider {
    static var previews: some View {
        StickyNote(note: NoteStruct(note_title: "Mein Lieblingsort", note_description: "Hier ist meindkjbköebkjbe  epifhpehflejdvbljeblj efjhegfökjebökfbeökfjb fdjhegbfipuebfpibe ifgeipfbepifbiepbfkwbök fpwifpiebwfpiewbfpieb wpifbwkbfökwb fwihbfkwbfi wkbwkfbök wlkbwkjlfbmw fiwfbjkwfbklwfjbwbfpiube wökfbwpiubfpiuerbfpieubfibewljbfwebfir pwibfpierbfpierbfi wepifbeiprubfpierbfpei wepifberipubfpierubfrp lieblingsort", note_location_latitude: "43.234524", note_location_longitude: "23.234502", note_category: "happy", note_created_at: "23.06.2000", note_author: "Fish", note_building: "Museum"))
    }
}
