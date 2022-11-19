//
//  AccountView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct AccountView: View {

    @State private var notes: String = ""
    var body: some View {
        VStack{
           
            Image("testImage")
                .profilePictureModifier()
                .padding(20.0)
            
            
            TextComponent(text: "Firstname Lastname", description: "Username")
            
            Divider()
            Spacer()
        }.padding(40.0)
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
