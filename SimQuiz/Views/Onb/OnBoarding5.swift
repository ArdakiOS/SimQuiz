//
//  OnBoarding5.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct OnBoarding5: View {
    @Binding var showOnb : Bool
    var body: some View {
        ZStack{
            Color("#20232F").ignoresSafeArea()
            VStack(spacing: 0){
                Text("A great opportunity")
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
                    Image("Onb5")
                        .resizable()
                }
                .frame(width: 375, height: 404)
                
                Spacer()
                
                Text("Get your unique experience now")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.bottom, 40)
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.4)){
                        showOnb = false
                    }
                    UserDefaults.standard.setValue(showOnb, forKey: "showOnb")
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
