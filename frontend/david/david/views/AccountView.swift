//
//  AccountView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI

struct AccountView: View {

    @State private var firstName: String = ""

    var body: some View {
        VStack{
           
            Image("testImage")
                .profilePictureModifier()
                .padding(20.0)
            
            Divider()
            Text("My Author Name:").modifier(TitleModifier())
            
                TextField(text: $firstName, prompt: Text("Max")) {
                    Text("First Name")
                }
                TextField(
                    "User name (email address)",
                    text: $firstName
                )
                .onSubmit {
                    UserSettingsManager.settings.addFirstName(firstName: firstName)
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)

            
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
