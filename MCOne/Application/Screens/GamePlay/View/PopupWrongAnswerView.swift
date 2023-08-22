//
//  PopupWrongAnswerView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct PopupWrongAnswerView: View {
    @EnvironmentObject var gamePlayViewModel: GamePlayViewModel
    
    var body: some View {
        Text("Yah jawaban kamu belum tepat. Ayo coba lagi!")
            .frame(alignment: .topLeading)
            .padding(20)
            .background(Color("BlueLight"))
            .background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
            )
            .foregroundColor(Color.white)
            .font(.headline)
            .task {
                await gamePlayViewModel.hideAlert(timer: 3)
            }
    }
}

struct PopupWrongAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        PopupWrongAnswerView().environmentObject(GamePlayViewModel())
    }
}
