//
//  PopupGuidance.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct PopupGuidance: View {
    @StateObject var gamePlayViewModel: GamePlayViewModel = GamePlayViewModel()
    
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
                        gamePlayViewModel.isOpenGuidance.toggle()
                    } label: {
                        Image("tombolMengerti")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                }
                .position(x:380, y:290)
            }.background(Image("guidanceAlert")
                .resizable()
                .scaledToFill()
                .frame(width: 400).ignoresSafeArea(.all)
            )
        }
    }
}

struct PopupGuidance_Previews: PreviewProvider {
    static var previews: some View {
        PopupGuidance()
    }
}
