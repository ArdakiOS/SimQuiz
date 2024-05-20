//
//  OnBoarding2.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//


import SwiftUI
import UserNotifications

struct OnBoarding2: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack(alignment: .bottom){
            Color("#20232F").ignoresSafeArea()
                
            VStack(spacing: 0){
                Text("Don't miss out on new \n update")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                
                
                Spacer()
                
                
                ZStack(alignment: .bottom){
                    Image("Onb2")
                        .resizable()
                        .offset(y:50)
                        
                    Button(action: {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                            if granted{
                                //
                            }
                            else{
                                print("Not Granted Notif")
                            }
                            currentPage = .three
                        }
                    }, label: {
                        Text("Show")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .frame(maxWidth: 343, maxHeight: 53)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("#3780EF"))
                            }
                    })
                    
                }
                .ignoresSafeArea()

                
            }
            .frame(maxHeight: .infinity)
            .ignoresSafeArea()
            .padding(.vertical)
            .foregroundColor(.white)
        }
        .frame(maxHeight: .infinity)
        
    }
}

