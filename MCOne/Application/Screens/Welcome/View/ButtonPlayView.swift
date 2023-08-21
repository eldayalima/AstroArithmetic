//
//  ButtonPlayView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct ButtonPlayView: View {
    var isRotated : Bool = false
    var blinking : Bool = false
    var animation: Animation {
        Animation.easeInOut.repeatForever(autoreverses: true).speed(0.5)
    }
    
    var body: some View {
        Image("play_button3")
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(Angle.degrees(isRotated ? 10 : -10))
            .animation(animation, value: isRotated)
            .offset(y: 75)
    }
}

struct ButtonPlayView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlayView()
    }
}
