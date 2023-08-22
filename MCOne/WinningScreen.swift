//
//  WinningScreen.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 11/04/23.
//

import SwiftUI

struct WinningScreen: View {
    @State var replayGame: Bool = false
    
    
    var body: some View {
       
            VStack{
                Image("helmet3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.top, 40)
                
                NavigationLink(destination: ContentView(), isActive: $replayGame){
                    Button(){
                        replayGame.toggle()
                    } label: {
                        Image("replayGameButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                    }
                    .padding(.vertical, 10)
                }
            }
            .position(x:380, y: 210)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("End_Game_Screen 2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WinningScreen_Previews: PreviewProvider {
    static var previews: some View {
        WinningScreen()
    }
}
