//
//  LeaderBoardSuccessView.swift
//  david
//
//  Created by Heidi Albarazi on 30.12.22.
//

import SwiftUI


struct LeaderBoardSuccessView: View {
    public var mockNotes = [
        NoteStruct(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan"),
        NoteStruct(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan"),
        NoteStruct(title: "kakak", description: "ksknk", latitude: "23.304", longitude: "12.029", created_at: "25.03.1999", author: "lala fanfan")
        ]
    public var model
    var body: some View {
        VStack{
            LottieView(name:"rocketLottie")
            List(mockNotes, id: \.id){ note in
                GroupBox(label: Text(note.title), content: {
                    Text(note.description)
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
            GroupBox(label: Text(note.title), content: {
                Text(note.description)
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
}

struct LeaderBoardSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardSuccessView()
    }
}
