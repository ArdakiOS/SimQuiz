//
//  GameView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct GameView: View {
    @State var candleData: [candleGraphModel] = [
        candleGraphModel(open: 100, close: 120, high: 130, low: 90),
        candleGraphModel(open: 120, close: 110, high: 140, low: 100),
        candleGraphModel(open: 110, close: 105, high: 115, low: 100),
        candleGraphModel(open: 105, close: 115, high: 120, low: 100),
        candleGraphModel(open: 115, close: 100, high: 120, low: 95),
        candleGraphModel(open: 100, close: 110, high: 115, low: 90),
        candleGraphModel(open: 110, close: 115, high: 120, low: 100),
        candleGraphModel(open: 115, close: 125, high: 130, low: 110),
        candleGraphModel(open: 125, close: 120, high: 135, low: 118),
        candleGraphModel(open: 120, close: 125, high: 130, low: 118),
    ]
    
    @State var isCorrect : Bool? = true
    @State var revealAnswer : Bool = false
    
    @Binding var score : Int
    var body: some View {
        VStack{
            Text("Game")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(width: 343, alignment: .leading)
            
            Spacer()
            
            HStack{
                Image("Cup")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Your score")
                
                
                Text("\(score)")
            }
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .frame(width: 173, height: 54)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("#353948"))
            )
            
            Spacer()
            
            Text("Try to guess where the chart will go and earn points")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ZStack{
                VStack{
                    Spacer()
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .frame(height: 1)
                        .foregroundColor(Color(red: 53/255, green: 57/255, blue: 72/255))
                    Spacer()
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .frame(height: 1)
                        .foregroundColor(Color(red: 53/255, green: 57/255, blue: 72/255))
                    Spacer()
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                        .frame(height: 1)
                        .foregroundColor(Color(red: 53/255, green: 57/255, blue: 72/255))
                    Spacer()
                }
                
                GraphView(candleData: $candleData)
                
            }
            .frame(width: 340, height: 240)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 33/255, green: 35/255, blue: 49/255))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("#353948"))
            }
            
            Spacer()
            VStack{
                if isCorrect != nil{
                    if isCorrect! {
                        Text("+25 XP")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                    }
                    else{
                        Text("-25 XP")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                    }
                }
                else{
                    EmptyView()
                }
            }
            .frame(height: 21)
            .opacity(revealAnswer ? 1 : 0)
            
            
            Spacer()
            
            HStack{
                Button(action: {
                    addCandle(willRise: false)
                    UserDefaults.standard.setValue(score, forKey: "gameScore")
                }, label: {
                    HStack{
                        Image("Sell")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Sell")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                    }
                    .frame(width: 165, height: 53)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("#EF6B4F"))
                    )
                })
                .disabled(revealAnswer)
                
                Button(action: {
                    addCandle(willRise: true)
                    UserDefaults.standard.setValue(score, forKey: "gameScore")
                }, label: {
                    HStack{
                        Image("Buy")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Buy")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                    }
                    .frame(width: 165, height: 53)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("#54BB49"))
                    )
                })
                .disabled(revealAnswer)
                
            }
            
            Spacer()
            
        }
        .foregroundStyle(.white)
        .frame(width: 343)
    }
    
    func addCandle(willRise : Bool) {
        let last = candleData.last
        let randClose = Int.random(in: -20...20)
        var high = 0
        var low = 0
        let newClose = randClose + last!.close
        
        if newClose > last!.close {
            high = newClose + Int.random(in: 5...15)
            low = last!.close - Int.random(in: 5...15)
        }
        else {
            high = last!.close + Int.random(in: 5...15)
            low = last!.close + randClose - Int.random(in: 5...15)
        }
        
        
        let newEntry = candleGraphModel(open: last!.close, close: newClose, high: high, low: low)
        candleData.append(newEntry)
        candleData.remove(at: 0)
        
        if newClose > last!.open {
            if willRise == true {
                isCorrect = true
                score += 25
            }
            else {
                isCorrect = false
                if score > 25{
                    score -= 25
                }
                else {
                    score = 0
                }
            }
        }
        else {
            if willRise == true {
                isCorrect = false
                if score > 25{
                    score -= 25
                }
                else {
                    score = 0
                }
                
            }
            else {
                isCorrect = true
                score += 25
            }
        }
        revealAnswer = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            revealAnswer = false
            isCorrect = nil
        }
    }
}

#Preview {
    NavView(selectedPage: .game)
}


struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
