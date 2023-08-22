//
//  ContentView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gamePlayViewModel: GamePlayViewModel = GamePlayViewModel()
    @State var isOpenGuidance: Bool = false
    @State var isWrongAnswer: Bool = false
    var body: some View {
        NavigationView(){
            ZStack{
                NavigationLink(destination: WinningScreen()){}
                ListQuestionView()
                
                
                //                if gamePlayViewModel.isShowCorrectAlert {
                //                    PopupCorrectAnswerView()
                //                }
                
                if self.gamePlayViewModel.isShowAlert{
                    PopupWrongAnswerView()
                }
                //                if gamePlayViewModel.isGameFinished{
                //                    PopupFinished()
                //                }
                //                if gamePlayViewModel.confirmReplayGame{
                //                    PopupReplayGame()
                //                }
                if isOpenGuidance {
                    PopupGuidance()
                }
            }
            .onReceive(gamePlayViewModel.$isShowAlert){ newName in
                print(newName)
                print("User name changed to ==========>")
                if(!newName){
                    isWrongAnswer = newName
                }
            }
//            .onChange(of: gamePlayViewModel.isOpenGuidance, perform: { newValue in
//                isShowPopupGuidance.toggle()
//            })
            
            
            
        }
        .environmentObject(gamePlayViewModel)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GamePlayViewModel())
    }
}
