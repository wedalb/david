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
           
            LottieView(name: "userProfileLottie")
            
            Divider()
            Text("My Author Name: Sarah").modifier(TitleModifier())
            
            
            
            Divider()
            Spacer()
            Spacer()
        }.padding(40.0)
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
