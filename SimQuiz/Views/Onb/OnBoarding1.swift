//
//  OnBoarding1.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI


struct OnBoarding1: View {
    @Binding var currentPage : myTabs
    let att = ATTObserver()
    var body: some View {
        ZStack{
            Color("#20232F").ignoresSafeArea()
            VStack(spacing: 0){
                Text("Welcome!")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 8)
                Spacer()
                
                
                ZStack{
                    Ellipse()
                        .fill(Color("#3780EF"))
                        .blur(radius: 38)
                        .opacity(0.25)
                    Image("Onb1")
                        .resizable()
                }
                .frame(width: 232, height: 366)
                .scaleEffect(1.1)
                Spacer()
                
                Text("Let's introduce you\nto the functionality, you will like it!")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    att.requestTrackingAuthorization{
                        currentPage = .two
                    }
                }, label: {
                    Text("Continue")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .frame(maxWidth: 343, maxHeight: 53)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("#3780EF"))
                        }
                })
                
            }
            .padding(.vertical)
            .foregroundColor(.white)
        }
        
    }
}

