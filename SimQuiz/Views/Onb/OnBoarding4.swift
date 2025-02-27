//
//  OnBoarding4.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//


import SwiftUI
import StoreKit

struct OnBoarding4: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack{
            Color("#20232F").ignoresSafeArea()
            VStack(spacing: 0){
                Text("Help us to improve the app")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 8)
                
                Spacer()
                Text("Other users about us")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom)
                ZStack{
                    Ellipse()
                        .fill(Color("#3780EF"))
                        .blur(radius: 38)
                        .opacity(0.25)
                    Image("Onb4")
                        .resizable()
                }
                .frame(width: 326, height: 253)
                
                Spacer()
                
                Button(action: {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        SKStoreReviewController.requestReview(in: windowScene)
                    }
                    currentPage = .five
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
            .padding(.vertical)
            .foregroundColor(.white)
        }
        
    }
}
