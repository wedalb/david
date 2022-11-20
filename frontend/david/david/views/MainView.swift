//
//  MainView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        WindowGroup{
            TabView {
                
                //LeaderBoardView()
                LeaderBoardView()
                    .tabItem {
                        Label("Leaderboard", systemImage: "list.number")
                    }
                
                
                MapButton()
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
