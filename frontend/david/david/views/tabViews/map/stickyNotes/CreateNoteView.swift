//
//  CreateNoteView.swift
//  david
//
//  Created by Hannes Wagner on 19.11.22.
//

import SwiftUI
import Foundation

struct CreateNoteView: View {
    @State private var title = ""
    @State private var descriptionText = ""
    
    @StateObject var model = CreateNoteViewModel()
    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                //Sticky Notes Element
                VStack(alignment: .leading, spacing: 8) {
                    
                    
                    TextField("Notes Title", text: $title)
                    Spacer()
                    TextField("Tell us your story", text: $descriptionText)
                    
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
                
                //Button
                Button("Create new Note"){
                    let location = locationManager.location
                    model.createNote(note_title: title, note_description: descriptionText, note_location_latitude: "\(String(describing: locationManager.location?.latitude))" , note_location_longitude:  "\(String(describing: locationManager.location?.longitude))", note_created_at: "", note_author: "")
                }
                
            }
        }
    }
}
    
