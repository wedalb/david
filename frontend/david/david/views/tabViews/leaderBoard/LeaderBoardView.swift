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
    
    var body: some View {
        NavigationView {
            if model.hasError {
                VStack {
                    Spacer()
                    LottieView(name: "ErrorMessageLottie")
                    Text("An Error has occurred.")
                        .modifier(TitleModifierNotes())
                        .foregroundColor(.accentColor)
                    Button(action: {
                        Task{
                            await model.load()
                        }
                    }){
                        HStack {
                            Image(systemName: "goforward")
                                .font(.title)
                            Text("Try Again! ")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(40)
                    }.padding()
                    Spacer()
                    Spacer()
                } .navigationTitle("Leader Board")
                
            } else {
                List(model.sortedNotes, id: \.id){ note in
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
        }.task { await model.load() }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}

