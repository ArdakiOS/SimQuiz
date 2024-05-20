//
//  QuizView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct QuizView: View {
    @StateObject var quizVM = QuizVM()
    @State var showQuestion = false
    @State var selecetedLvl = 0
    var body: some View {
        VStack(alignment: .leading){
            Text("Advanced Quiz")
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            Spacer()
            Text("The Advanced test includes 4 levels of 5 questions, answer everything correctly, and you will be able to completely fill out the progress scale!")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
                .fontWeight(.semibold)
            Spacer()
            Text("Your progress")
                .font(.system(size: 16))
                .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("#292B39"))
                    .frame(width: 343, height: 24)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("#3780EF"))
                    .frame(width: CGFloat(343 * (Double(quizVM.totalPrg) / 20.0)), height: 24)
            }
            
            Spacer()
            
            Button {
                selecetedLvl = 0
                showQuestion = true
                
            } label: {
                quizRow(lvl: 1, prg: quizVM.lvl1[0].prg, canStart: true)
            }
            
            Button {
                showQuestion = true
                selecetedLvl = 1
            } label: {
                quizRow(lvl: 2, prg: quizVM.lvl1[1].prg, canStart: quizVM.lvl1[0].prg == 5)
            }
            .disabled(quizVM.lvl1[0].prg != 5)
            
            Button {
                showQuestion = true
                selecetedLvl = 2
            } label: {
                quizRow(lvl: 3, prg: quizVM.lvl1[2].prg, canStart: quizVM.lvl1[1].prg == 5)
            }
            .disabled(quizVM.lvl1[1].prg != 5)
            
            Button {
                showQuestion = true
                selecetedLvl = 3
            } label: {
                quizRow(lvl: 4, prg: quizVM.lvl1[3].prg, canStart: quizVM.lvl1[2].prg == 5)
            }
            .disabled(quizVM.lvl1[2].prg != 5)
            Spacer()
            
            
            
        }
        .fullScreenCover(isPresented: $showQuestion, content: {
            QuestionPage(back: $showQuestion, quizVM: quizVM, selectedLvl: $selecetedLvl)
        })
        .frame(width: 343)
        .foregroundStyle(.white)
    }
}

#Preview {
    NavView(selectedPage: .quiz)
}


struct quizRow : View {
    let lvl : Int
    let prg : Int
    let canStart : Bool
    var body: some View {
        HStack{
            Text("Lvl \(lvl)")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Spacer()
            if canStart {
                Text("Question \(prg)/5")
                    .font(.system(size: 16))
            }
            else{
                Image("Lock")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
        .frame(width: 343, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(prg == 5 ? Color("#3780EF") : Color("#292B39"))
        )
    }
}
