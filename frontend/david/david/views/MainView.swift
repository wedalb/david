//
//  MainView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct MainView: View {
    let gradient = LinearGradient(colors: [.white, .accentColor],
                                      startPoint: .topLeading,
                                      endPoint: .bottomTrailing)
    var body: some View {
        TabView {
            ZStack{
                //LeaderBoardView()
                gradient
                    .opacity(0.7)
                    .ignoresSafeArea()
                LeaderBoardView()
            }
            .tabItem {
                    Label("Leaderboard", systemImage: "list.number")
                }

            ZStack {
                VStack{
                    MapButton()
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color.clear)
                }
                            
            }
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
