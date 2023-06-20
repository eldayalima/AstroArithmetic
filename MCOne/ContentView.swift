//
//  ContentView.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 09/04/23.
//

import SwiftUI

struct Number: Hashable {
    var id: String = UUID().uuidString
    var num1: Int
    var num2: Int
    var resAdd: Int
    var isCorrect: Bool = false
}

//struct RandomImage : View {
//    let imageName = imageNames.randomElement() ?? ""
//
//    var body: some View{
//        Image(imageName)
//            .resizable()
//            .frame(width: 350, height: 190)
//    }
//}

struct ContentView: View {
    @State var question: [[Number]] = []
    @State var isShowAlert: Bool = false
    @State var isShowCorrectAlert: Bool = false
    @State var sumCorrectAns: [String] = []
    @State var isGameFinished: Bool = false
    @State var confirmReplayGame: Bool = false
    @State var imageName: String = "helmet3"
    @State private var showAddView = false
    @State var isOpenGuidance: Bool = true
    
    init(){
        imageName = randomImageName()
    }
    
    func randomImageName() -> String {
        let imageNames = ["helmet3", "Astronout","Glove", "Shoes", "Suit"]
        let imageName = imageNames.randomElement() ?? "helmet3"
        return imageName
    }
    
    
    func generateRandomNum(){
        var randomNumber_ : [[Number]] = []
        //        var ansNumber: [Number] = []
        
        for _ in 0..<4 {
            var arrNumTemp: [Number] = []
            for _ in 0..<4{
                let tempNum1 = Int.random(in: 1..<10)
                let tempNum2 = Int.random(in: 1..<10)
                let resTemp = tempNum1 + tempNum2
                let tempData = Number(num1: tempNum1, num2: tempNum2, resAdd: resTemp)
                arrNumTemp.append(tempData)
            }
            randomNumber_.append(arrNumTemp)
            arrNumTemp.removeAll()
        }
        question = randomNumber_
        print(question)
    }
    
    func hideAlert (timer: Int) async{
        try? await Task.sleep(for: .seconds(timer))
        isShowAlert=false
        isShowCorrectAlert=false
    }
    
    var body: some View {
        NavigationView(){
            ZStack{
                NavigationLink(destination: WinningScreen(), isActive: $isGameFinished){}
                HStack{
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
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 350, height: 190)

                                QuestionView(question: $question, isShowAlert: $isShowAlert, sumCorrectAns: $sumCorrectAns, isGameFinished: $isGameFinished, isShowCorrectAlert: $isShowCorrectAlert)
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
                                isOpenGuidance.toggle()
                               
                            } label: {
                                Image("helpButton")
                                    .resizable()
                                    .frame(width: 37, height: 41)
                                    .padding(.vertical, 10)
                            }
                            Button(){
                                confirmReplayGame.toggle()
                               
                            } label: {
                                Image("restartButton")
                                    .resizable()
                                    .frame(width: 37, height: 41)
                                    .padding(.vertical, 10)
                            }
                        }
                        Spacer()
                        AnswerView(question: question)
                        
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("BgMainScreen")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                )
                .onAppear(){
                    showAddView = true
                    generateRandomNum()
                    var isFinish: Bool = false
                    for quest in question{
                        for q in quest {
                            print(q.isCorrect)
                            isFinish=q.isCorrect
                        }
                    }
                    print("isfinish",isFinish)
                }
                if isShowCorrectAlert{
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
                                await hideAlert(timer: 1)
                            }
                    }
                    .position(x:370, y:35)
                }
                
                if isShowAlert{
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
                            await hideAlert(timer: 3)
                        }
                }
                if(isGameFinished){
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
                            await hideAlert(timer: 3)
                        }
                }
                if(confirmReplayGame){
                    ZStack{
                        if showAddView{
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
                                    print("correct")
                                    generateRandomNum()
                                    sumCorrectAns.removeAll()
                                    confirmReplayGame.toggle()
                                    imageName = randomImageName()
                                } label: {
                                    Image("correct_button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                }
                                Button(){
                                    print("wrong")
                                    confirmReplayGame.toggle()
                                    
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
                if(isOpenGuidance){
                    ZStack{
                        if showAddView{
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
                                    isOpenGuidance.toggle()
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
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    struct QuestionView: View {
        @Binding var question : [[Number]]
        @Binding var isShowAlert: Bool
        @Binding var sumCorrectAns: [String]
        @Binding var isGameFinished: Bool
        @Binding var isShowCorrectAlert: Bool
        
        var body: some View{
            HStack{
                ForEach(Array(question.enumerated()), id: \.offset){i, que in
                    VStack{
                        ForEach(Array(que.enumerated()), id: \.offset){x, num in
                            HStack{
                                Text("\(question[i][x].num1) + \(question[i][x].num2)")
                                    .frame(width: 88, height: 52)
                                    .foregroundColor(Color(.white))
                                    .background(
                                        Rectangle()
                                            .stroke(Color("BlueLight"), lineWidth: 1)
                                    )
                                    .background(Color("PurpleLight"))
                                    .padding(.horizontal, 3)
                                    .font(.system(size: 14).bold())
                                    .onDrop(of: ["text"], delegate: DTDropTarget(num1: question[i][x].num1, num2: question[i][x].num2) { succeed in
                                        print(succeed)
                                        if succeed{
                                            isShowCorrectAlert=true
                                            question[i][x].isCorrect = true
                                            sumCorrectAns.append( question[i][x].id)
                                            print("liat sini",sumCorrectAns.count, question.count)
                                            
                                            if(sumCorrectAns.count == 16){
                                                print("Game selesai")
                                                isGameFinished=true
                                            }
                                        }else{
                                            isShowAlert=true
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
    
    struct AnswerView: View {
        var question : [[Number]]
        //        var shuffledQuestion: [[Number]] = ques
        var body: some View{
            HStack{
                ForEach(Array(question.enumerated()), id: \.offset){i, que in
                    VStack{
                        ForEach(Array(que.enumerated().shuffled()), id: \.offset){x, num in
                            HStack{
                                Text("\(question[i][x].resAdd)")
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
                                        NSItemProvider(object: String(question[i][x].resAdd) as NSString)
                                    })
                            }
                            .opacity(num.isCorrect == true ? 0 : 1)
                        }
                    }
                }
            }
        }
    }
}


struct DTDropTarget: DropDelegate {
    var num1: Int
    var num2: Int
    
    var onComplete: ((Bool) -> ())
    
    func performDrop(info: DropInfo) -> Bool {
        print(num1, num2)
        let provider = info.itemProviders(for: [.text]).first
        
        provider?.loadTransferable(type: String.self) { result in
            switch result {
            case .success(let string):
                Task {
                    await onComplete(await num1 + num2 == Int(string)!)
                }
                print("Result:", string)
            case .failure(let error):
                print(error)
            }
        }
        
        return true
    }
    
    func dropEntered(info: DropInfo) {
        print(info)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
