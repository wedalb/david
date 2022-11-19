//
//  LeaderBoardErrorView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//
import Lottie
import SwiftUI

struct LeaderBoardError: View {
    @StateObject var model = LeaderBoardViewModel()
    var body: some View {
        VStack {
            Spacer()
            let animationView = AnimationView()
            animationView.animation = Animation.named("ErrorMessageLottie")
            animationView.play()
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
        }
    }
}

struct LeaderBoardError_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardError()
    }
}
