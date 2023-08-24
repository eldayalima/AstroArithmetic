//
//  ListQuestionView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct ListQuestionView: View {
    @EnvironmentObject var gamePlayViewModel: GamePlayViewModel
    var body: some View {
        HStack {
            VStack{
                Spacer()
                VStack{
                    VStack{
                        Text("Penjumlahan")
                            .font(.system(size: 24))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(.white))
                    }
                    ZStack{
                        Image(gamePlayViewModel.imageName)
                            .resizable()
                            .frame(width: 350, height: 190)

                        QuestionView()
                    }
                    .frame(maxWidth: 347, maxHeight: 202)
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: 387, maxHeight: 300)
                .background(Color("PurpleDark"))
                .cornerRadius(10)
            }
            
            
            Spacer()
            
            VStack{
                HStack(alignment: .bottom){
                    Spacer()
                    Button(){
                        gamePlayViewModel.isOpenGuidance.toggle()
                       
                    } label: {
                        Image("helpButton")
                            .resizable()
                            .frame(width: 37, height: 41)
                            .padding(.vertical, 10)
                    }
                    Button(){
                        gamePlayViewModel.confirmReplayGame.toggle()
                       
                    } label: {
                        Image("restartButton")
                            .resizable()
                            .frame(width: 37, height: 41)
                            .padding(.vertical, 10)
                    }
                }
                Spacer()
                AnswerView()
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("BgMainScreen")
            .resizable()
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ListQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ListQuestionView().environmentObject(GamePlayViewModel())
    }
}
