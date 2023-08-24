//
//  PopupReplayGame.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct PopupReplayGame: View {
    @EnvironmentObject var gamePlayViewModel: GamePlayViewModel
    
    var body: some View {
        ZStack{
            if gamePlayViewModel.showAddView{
                Rectangle()
                    .fill(Color.white)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
            }
            VStack{
                HStack(){
                    Button(){
                        gamePlayViewModel.generateRandomNum()
                        gamePlayViewModel.sumCorrectAns.removeAll()
                        gamePlayViewModel.confirmReplayGame.toggle()
                        gamePlayViewModel.imageName = gamePlayViewModel.randomImageName()
                    } label: {
                        Image("correct_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    Button(){
                        gamePlayViewModel.confirmReplayGame.toggle()
                        
                    } label: {
                        Image("wrong_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                }
                .position(x:380, y:260)
            }.background(Image("ImgAlert")
                .resizable()
                .scaledToFill()
                .frame(width: 400)
            )
        }
    }
}

struct PopupReplayGame_Previews: PreviewProvider {
    static var previews: some View {
        PopupReplayGame().environmentObject(GamePlayViewModel())
    }
}
