//
//  WelcomeView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State var rot : Double = 0
    var body: some View {
        if rot < 480 {
            LoadView(rot: $rot)
        }
        else{
            NavView()
        }
    }
}

#Preview {
    WelcomeView()
}
