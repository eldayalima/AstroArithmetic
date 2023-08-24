//
//  AnswerView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var gamePlayViewModel: GamePlayViewModel
    
    var body: some View{
        HStack{
            ForEach(Array(gamePlayViewModel.listQuestion.enumerated()), id: \.offset){i, que in
                VStack{
                    ForEach(Array(que.enumerated().shuffled()), id: \.offset){x, num in
                        HStack{
                            Text("\(gamePlayViewModel.listQuestion[i][x].resAdd)")
                                .frame(width: 75, height: 35)
                                .foregroundColor(Color(.white))
                                .background(
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .stroke(Color("PurpleLight"), lineWidth: 3)
                                )
                                .background(Color("PurpleDark"))
                                .padding(2)
                                .font(.system(size: 20).bold())
                                .onDrag({
                                    NSItemProvider(object: String(gamePlayViewModel.listQuestion[i][x].resAdd) as NSString)
                                })
                        }
                        .opacity(num.isCorrect == true ? 0 : 1)
                    }
                }
            }
        }
    }
    
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView().environmentObject(GamePlayViewModel())
    }
}
