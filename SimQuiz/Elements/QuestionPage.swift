//
//  QuestionPage.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI


enum AnswerState {
    case unanswered
    case correct
    case incorrect
}

struct QuestionPage: View {
    @Binding var back : Bool
    @ObservedObject var quizVM : QuizVM
    @State var idx = 0
    @State var revealAns = false
    @State var selectedAns = ""
    @Binding var selectedLvl : Int
    @State var curScore = 0
    @State private var answers: [AnswerState] = Array(repeating: .unanswered, count: 5)
    @State var showBackPrompt = false
    @State var wrongCnt = UserDefaults.standard.integer(forKey: "wrongCnt")
    var body: some View {
        ZStack{
            
            Color("#20232F").ignoresSafeArea()
            VStack{
                HStack{
                    Text("Advanced Quiz Lvl \(selectedLvl + 1)")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        
                        showBackPrompt = true
                    } label: {
                        Text("Back")
                    }
                    
                }
                
                
                HStack {
                    ForEach(0..<answers.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 6)
                            .foregroundColor(self.color(for: answers[index]))
                    }
                }
                .padding(.vertical, 30)
                
                Text(quizVM.lvl1[selectedLvl].questions[idx].question)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 295)
                    .frame(width: 343, height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("#292B39"))
                    )
                    .padding(.bottom, 50)
                
                
                ForEach(quizVM.lvl1[selectedLvl].questions[idx].answers, id:\.self){row in
                    Button(action: {
                        selectedAns = row
                        revealAns = true
                        
                        if selectedAns == quizVM.lvl1[selectedLvl].questions[idx].correctAns {
                            
                            answers[idx] = .correct
                            curScore += 1
                            if selectedLvl == 0 {
                                if quizVM.totalPrg < 5 {
                                    quizVM.totalPrg += 1
                                }
                            }
                            else if selectedLvl == 1 {
                                UserDefaults.standard.setValue(true, forKey: "Spend 5 minutes in the quiz")
                                if quizVM.totalPrg < 10 {
                                    quizVM.totalPrg += 1
                                }
                            }
                            else if selectedLvl == 2 {
                                if quizVM.totalPrg < 15 {
                                    quizVM.totalPrg += 1
                                }
                            }
                            else if selectedLvl == 3 {
                                if quizVM.totalPrg < 20 {
                                    quizVM.totalPrg += 1
                                    if quizVM.totalPrg == 20 {
                                        UserDefaults.standard.setValue(true, forKey: "Finish the quiz")
                                    }
                                }
                            }
                            
                        }
                        else{
                            wrongCnt += 1
                            if wrongCnt == 5 {
                                UserDefaults.standard.setValue(true, forKey: "Make a mistake 5 times")
                            }
                            answers[idx] = .incorrect
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            if idx + 1 <= quizVM.lvl1[selectedLvl].questions.count - 1{
                                idx += 1
                                revealAns = false
                            }
                            else{
                                if quizVM.lvl1[selectedLvl].prg < curScore {
                                    quizVM.lvl1[selectedLvl].prg = curScore
                                }
                                quizVM.save()
                                
                                if curScore == 1 {
                                    UserDefaults.standard.setValue(true, forKey: "Answer only one question correctly")
                                }
                                
                                if curScore == 5 {
                                    UserDefaults.standard.setValue(true, forKey: "Complete the first level")
                                    
                                }
                                curScore = 0
                                back = false
                            }
                        }
                    }, label: {
                        Text(row)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 343)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedAns == row ? Color("#EF6B4F") : Color("#292B39"))
                                    if revealAns && row == quizVM.lvl1[selectedLvl].questions[idx].correctAns {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color("#54BB49"))
                                    }
                                }
                                
                            )
                    })
                    .disabled(revealAns)
                    .padding(.bottom, 5)
                }
                
                Spacer()
                
            }
            .frame(width: 343)
            
            if showBackPrompt{
                Color.black.ignoresSafeArea().opacity(0.3)
                VStack{
                    Text("You really want to out?")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    HStack{
                        Button {
                            if quizVM.lvl1[selectedLvl].prg < curScore {
                                quizVM.lvl1[selectedLvl].prg = curScore
                            }
                            quizVM.save()
                            curScore = 0
                            UserDefaults.standard.setValue(true, forKey: "Quit the quiz without finishing it")
                            back = false
                        } label: {
                            Text("Yes")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .frame(width: 147.5, height: 45)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("#20232F")))
                        }
                        
                        Button {
                            
                            showBackPrompt = false
                        } label: {
                            Text("Stay")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .frame(width: 147.5, height: 45)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color("#3780EF")))
                        }

                    }
                }
                .frame(width: 343, height: 155)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color("#292B39"))
                )
                
            }
        }
        .animation(.easeInOut(duration: 0.4), value: showBackPrompt)
        .animation(.easeInOut(duration: 0.4), value: idx)
        .foregroundColor(.white)
    }
    
    func color(for state: AnswerState) -> Color {
        switch state {
        case .unanswered:
            return Color("#292B39")
        case .correct:
            return .green
        case .incorrect:
            return .red
        }
    }
}

#Preview{
    QuizView(showQuestion: true)
}

