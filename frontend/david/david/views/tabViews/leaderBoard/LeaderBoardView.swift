//
//  LeaderBoardView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//
import SwiftUI
import Lottie

import SwiftUI


/**
 The MovieListView creates a listview out of all movies that we have and uses the MovieRow View to display them in a list.
 - Parameter movie: An Array of GhibliMovies that we will display in the list.
 */
struct LeaderBoardView: View {
    
    @StateObject var model = LeaderBoardViewModel()
    
    public var mockNotes = [
        NoteStruct(note_title: "My favourite place", note_description: "This is my favourite place in the world, because this is where I have met my boyfriend. We went to a really nice restaurant and ate some very special food", note_location_latitude: "11.669046 48.262034", note_location_longitude: "11.670845 48.265421", note_category: "happy", note_created_at: "23.06.2022", note_author: "Sarah"),
        NoteStruct(note_title: "Great place for halloween", note_description: "Me and my friends always used to tell each other scary stories at this place here. I was so scared", note_location_latitude: "34.43245", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "23.04.2022", note_author: "scaredPerson"),
        NoteStruct(note_title: "Amazing nature", note_description: "As a student I always used to go on a hike at this place. Oh I miss these days", note_location_latitude: "34.43245", note_location_longitude: "11.669046 48.262034", note_category: "bdknle", note_created_at: "25.04.2012", note_author: "Hiker Mike"),
        NoteStruct(note_title: "Cheap Food", note_description: "As a kis I always used to get the cheapest food here!", note_location_latitude: "11.669046 48.262034", note_location_longitude: "23.356", note_category: "bdknle", note_created_at: "15.04.2015", note_author: "Tony")
        ]
    
    var body: some View {
        NavigationView {
            
            // if there is some kind of connectionerror
            if model.hasError {
                VStack(alignment: HorizontalAlignment.center) {
                    Spacer()
                    LottieView(name: "ErrorMessageLottie")
                    Text("An Error has occurred.")
                        .font(Font.custom("KohSantepheap-Regular", size: 20.0))
                        .bold()
                        .foregroundColor(.red)
                    Spacer()
                    Spacer()
                    Button("Try Connecting Again!") {
                        HStack {
                            Image(systemName: "goforward")
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(40)
                    }.padding()
                    Spacer()
                    
                } .navigationTitle("Leader Board")
                
                
                // no connection error
            } else {
                VStack{
                    LottieView(name:"rocketLottie")
                    List(mockNotes, id: \.id){ note in
                        GroupBox(label: Text(note.note_title), content: {
                            Text(note.note_description)
                                .padding(.top, 8)
                        })
                    }
                    .navigationTitle("Leader Board")
                    .toolbar {
                        Menu {
                            Text("Sort")
                            Button(action: {
                                model.setByTitleDescending(isDescending: !model.sortByTitleDescending)
                            }, label: {
                                let arrowType = model.sortByTitleDescending ? "down" : "up"
                                Image(systemName: "arrow.\(arrowType)")
                                Text("Alphabetically")
                            })
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
                List(mockNotes, id: \.id){ note in
                    GroupBox(label: Text(note.note_title), content: {
                        Text(note.note_description)
                            .padding(.top, 8)
                    })
                }
                .navigationTitle("Leader Board")
                .toolbar {
                    Menu {
                        Text("Sort")
                        Button(action: {
                            model.setByTitleDescending(isDescending: !model.sortByTitleDescending)
                        }, label: {
                            let arrowType = model.sortByTitleDescending ? "down" : "up"
                            Image(systemName: "arrow.\(arrowType)")
                            Text("Alphabetically")
                        })
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                } }
        }.task {
            try? await model.getNotes()
        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}

