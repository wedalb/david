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
        Note(title: "My fav place", description: "kskskdn", latitude: "11.96463", longitude: "23.956", created_at: "23.05.2000", author: "joe biden"),
        Note(title: "My fav place", description: "kskskdn", latitude: "11.96463", longitude: "23.956", created_at: "23.05.2000", author: "joe biden"),
        Note(title: "My fav place", description: "kskskdn", latitude: "11.96463", longitude: "23.956", created_at: "23.05.2000", author: "joe biden"),
        Note(title: "My fav place", description: "kskskdn", latitude: "11.96463", longitude: "23.956", created_at: "23.05.2000", author: "joe biden")
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
