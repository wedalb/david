//
//  VCard.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct VCard: View {
    var note: NoteStruct

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.note_title)
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            Text(note.note_description)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(note.note_title.uppercased())
                .opacity(0.7)
            Spacer()
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(Color.accentColor)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 8, x: 0, y: 12)
        .shadow(radius: 2, x: 0, y: 1)

    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(note: NoteStruct(note_title: "Mein Lieblingsort", note_description: "Hier ist mein lieblingsort", note_location_latitude: "43.234524", note_location_longitude: "23.234502", note_category: "happy", note_created_at: "23.06.2000", note_author: "Fish", note_building: "Museum"))
    }
}
