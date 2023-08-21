//
//  PopupFinished.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct PopupFinished: View {
    @StateObject var gamePlayViewModel: GamePlayViewModel = GamePlayViewModel()
    
    var body: some View {
        Text("Yey game telah selesai")
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

struct PopupFinished_Previews: PreviewProvider {
    static var previews: some View {
        PopupFinished()
    }
}
