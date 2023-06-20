//
//  WelcomeScreen.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 11/04/23.
//

import SwiftUI

struct WelcomeScreen: View {
    //variable
    
    @State private var blinking = false
    @State private var isRotated = false
    private var animation: Animation {
        Animation.easeInOut.repeatForever(autoreverses: true).speed(0.5)
    }
    
    
    var body: some View {
        NavigationView{
            ZStack {
                
                Image("light_astro")
                    .resizable()
                    .opacity(blinking ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: blinking)
                    .onAppear{
                        //withAnimation{blinking = true}
                    }
                Image("astro")
                    .resizable()
                Image("light_arith")
                    .resizable()
                    .opacity(blinking ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: blinking)
                    .onAppear{
                        //withAnimation{blinking = true}
                    }
                Image("arithmetic")
                    .resizable()
                Image("light_button")
                    .resizable()
                    .opacity(blinking ? 0.5 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: blinking)
                    .onAppear{
                        withAnimation{blinking = true}
                    }
                
                NavigationLink(destination: ContentView()) {
                    Image("play_button3")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle.degrees(isRotated ? 10 : -10))
                        .onAppear{
                            self.isRotated = true
                        }
                        .animation(animation, value: isRotated)
                }
                .offset(y: 75)
            }
            .background(Image("bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all ))
        }
    }

}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
