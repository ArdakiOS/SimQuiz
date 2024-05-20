//
//  LoadView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct LoadView: View {
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @Binding var rot : Double
    var body: some View {
        ZStack{
            Color("#20232F").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 120, height: 182)
                    .padding(.top, 100)
                Spacer()
                Image("Load")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(rot))
                    .padding(.bottom, 100)
                    
            }
            .onReceive(timer, perform: { _ in
                withAnimation {
                    rot += 10
                }
            })
        }
    }
}
