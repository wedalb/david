//
//  LottieView.swift
//  david
//
//  Created by Heidi Albarazi on 19.11.22.
//

import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    var name : String 
    var loopMode: LottieLoopMode = .loop

    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(name: "ErrorMessageLottie")
    }
}
