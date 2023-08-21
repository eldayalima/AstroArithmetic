//
//  WelcomeScreen.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 11/04/23.
//

import SwiftUI

struct WelcomeScreen: View {
    @StateObject var welcomeViewModel: WelcomeViewModel = WelcomeViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                ImageWithAnimation(
                    blinking: welcomeViewModel.blinking,
                    imgName: "light_astro"
                )
                Image("astro")
                    .resizable()
                ImageWithAnimation(
                    blinking: welcomeViewModel.blinking,
                    imgName: "light_arith"
                )
                Image("arithmetic")
                    .resizable()
                ImageWithAnimation(
                    blinking: welcomeViewModel.blinking,
                    imgName: "light_button"
                )
                NavigationLink(destination: ContentView()) {
                    ButtonPlayView(isRotated: welcomeViewModel.isRotated)
                        .onAppear{
                            welcomeViewModel.isRotated = true
                            withAnimation{welcomeViewModel.blinking = true}
                        }
                }
            }
            .background(Image("bg")
                .resizable()
                .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all )
        }
    }
    
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
