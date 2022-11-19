//
//  CreateNoteView.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import SwiftUI

struct CreateNoteView: View {
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


struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
