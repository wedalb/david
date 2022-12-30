//
//  LeaderBoardErrorView.swift
//  david
//
//  Created by Heidi Albarazi on 30.12.22.
//

import SwiftUI

struct LeaderBoardErrorView: View {
    var body: some View {
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
    }
}

struct LeaderBoardErrorView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardErrorView()
    }
}
