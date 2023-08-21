//
//  ContentView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 09/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gamePlayViewModel: GamePlayViewModel = GamePlayViewModel()
    
    var body: some View {
        NavigationView(){
            ZStack{
                NavigationLink(destination: WinningScreen()){}
                    ListQuestionView()
                if gamePlayViewModel.isShowCorrectAlert {
                    PopupCorrectAnswerView()
                }
                
                if gamePlayViewModel.isShowAlert{
                    PopupWrongAnswerView()
                }
                if gamePlayViewModel.isGameFinished{
                    PopupFinished()
                }
                if gamePlayViewModel.confirmReplayGame{
                    PopupReplayGame()
                }
                if gamePlayViewModel.isOpenGuidance {
                    PopupGuidance()
                }
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
