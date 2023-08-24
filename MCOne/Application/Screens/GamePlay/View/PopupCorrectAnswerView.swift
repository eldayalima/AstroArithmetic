//
//  PopupCorrectAnswerView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct PopupCorrectAnswerView: View {
    @EnvironmentObject var gamePlayViewModel: GamePlayViewModel
    
    var body: some View {
        VStack{
            Text("Benar!")
                .frame(alignment: .bottom)
                .padding(10)
                .background(Color.green)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                )
                .foregroundColor(Color.white)
                .font(.headline)
                .task {
                    await gamePlayViewModel.hideAlert(timer: 1)
                }
        }
        .position(x:370, y:35)
    }
}

struct PopupCorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        PopupCorrectAnswerView().environmentObject(GamePlayViewModel())
    }
}
