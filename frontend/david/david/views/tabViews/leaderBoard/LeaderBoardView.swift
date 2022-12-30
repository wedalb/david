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
        Note(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan"),
        Note(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan"),
        Note(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan")
        ]
    
    var body: some View {
        NavigationView {
            
            // if there is some kind of connectionerror
            if model.hasError {
                LeaderBoardErrorView()
            } else {
                VStack{
                    LottieView(name:"rocketLottie")
                    List {
                        ForEach(mockNotes, id: \.id) { note in
                            GroupBox(label: Text(note.title), content: {
                                Text(note.description)
                                    .padding(.top, 8)
                            })
                        }
                    }
                    .onAppear {
                        model.getNotes()
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
            }
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

