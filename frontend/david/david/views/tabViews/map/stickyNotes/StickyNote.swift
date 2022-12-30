//
//  VCard.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//
import SwiftUI

struct StickyNote: View {
    var note: Note

    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(note.title)
                    .modifier(TitleModifierNotes())
                    .frame(maxWidth: 170, alignment: .leading)
                    .layoutPriority(1)
                
                Text(note.description)
                    .modifier(TextModifierNotes())
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                HStack{
                    Text("created on: " + note.created_at)
                        .modifier(DescriptionModifierNotes())
                    Text("by: " + note.author)
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
        StickyNote(note: Note(title: "My favourite place in the whole world", description: "This is where I have met my boyfriend for the first time. ",latitude: "23.234502",  longitude: "23.234502", created_at: "23.06.2000", author: "Fish"))
    }
}
