//
//  CreateNoteView.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import SwiftUI
import Foundation

struct CreateNoteView: View {
    @State private var titleText = "Enter your headline"
    @State private var descriptionText = "Tell us about your story :)"
    
    @StateObject var model = CreateNoteViewModel()

    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 8) {

                
                Text("desc")
                    .modifier(TextModifierNotes())
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextEditor(text: $descriptionText)
                    .font(.body)
                    .padding()
                    .padding(.top, 20)
                    .onChange(of: descriptionText) { value in
                     //   model.createdNote.note_description = $descriptionText
                    }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                Spacer()
                
                // Automatic name and date of author
                HStack{
                    Text("created on: ")
                    Text(Date.now, style: .date)
                        .modifier(DescriptionModifierNotes())
                    Text("by: " + UserSettingsManager.settings.getSettings().firstName + UserSettingsManager.settings.getSettings().lastName)
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
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 8) {
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                /*               Text(note.note_title)
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
                 */
            }
        }
        
    }
}
