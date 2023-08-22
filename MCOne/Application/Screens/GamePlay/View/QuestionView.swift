//
//  QuestionView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var gamePlayViewModel: GamePlayViewModel = GamePlayViewModel()
    @State var isCorrect: Bool = false
    
    var body: some View {
        HStack{
            ForEach(Array(gamePlayViewModel.listQuestion.enumerated()), id: \.offset){i, que in
                VStack{
                    ForEach(Array(que.enumerated()), id: \.offset){x, num in
                        HStack{
                            Text("\(gamePlayViewModel.listQuestion[i][x].num1) + \(gamePlayViewModel.listQuestion[i][x].num2)")
                                .frame(width: 88, height: 52)
                                .foregroundColor(Color(.white))
                                .background(
                                    Rectangle()
                                        .stroke(Color("BlueLight"), lineWidth: 1)
                                )
                                .background(Color("PurpleLight"))
                                .padding(.horizontal, 3)
                                .font(.system(size: 14).bold())
                                .onChange(of: gamePlayViewModel.isShowAlert, perform: { val in
                                    print("======+> TRIGGRED")
                                    print(val)
                                    if(val){
                                        
                                        gamePlayViewModel.isShowCorrectAlert=true
                                        gamePlayViewModel.listQuestion[i][x].isCorrect = true
                                        gamePlayViewModel.sumCorrectAns.append( gamePlayViewModel.listQuestion[i][x].id)
                                    }else{
                                        
                                        self.gamePlayViewModel.isShowAlert=true
                                    }
                                })
                                .onDrop(of: ["text"] ,delegate:
                                            DTDropTarget(num1: gamePlayViewModel.listQuestion[i][x].num1, num2: gamePlayViewModel.listQuestion[i][x].num2)
                                        { succeed in
                                    if succeed{
                                        isCorrect = true
                                        
                                        if(gamePlayViewModel.sumCorrectAns.count == 16){
                                            //                                            print("Game selesai")
                                            gamePlayViewModel.isGameFinished=true
                                        }
                                    }else{
                                        isCorrect = false
                                    }
                                })
                                
                        }
                        .padding(-7)
                        .opacity(num.isCorrect == true ? 0 : 1)
                    }
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
