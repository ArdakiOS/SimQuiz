//
//  NavTabBar.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct NavTabBar: View {
    @Binding var selected : NavTabs
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .fill(Color("#2E3241"))
                .frame(height: 1)
            GeometryReader{ geo in
                HStack(spacing: 0){
                    
                    ForEach(NavTabs.allCases, id: \.self){tab in
                        Button(action: {
                            withAnimation(.bouncy(duration: 0.5)) {
                                selected = tab
                            }
                        }, label: {
                            VStack(spacing : 4){
                                Image(tab.rawValue)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(tab == selected ? Color("#3780EF") : Color("#787D8F"))
                                Text(tab.rawValue)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .foregroundColor(tab == selected ? Color("#3780EF") : Color.white)
                            }
                        })
                        .frame(width: geo.size.width/3)
                        
                    }
                }
                .frame(width: geo.size.width, height: 96)
                .background(
                    Color("#20232F")
                )
            }
        }
    }
}
