//
//  NavView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//


import SwiftUI

enum NavTabs : String, CaseIterable {
    case game = "Game"
    case quiz = "Quiz"
    case profile = "Profile"
}

struct NavView: View {
    @State var selectedPage : NavTabs = .game
    @State var showOnboarding = UserDefaults.standard.object(forKey: "showOnb") as? Bool ?? true
    
    @State var score = UserDefaults.standard.integer(forKey: "gameScore")
    var body: some View {
        if showOnboarding{
            AllOnboardingViews(showOnboarding: $showOnboarding)
        }
        else{
            ZStack {
                Color("#20232F").ignoresSafeArea()
                VStack{
                    switch selectedPage {
                    case .game:
                        GameView(score: $score)
                    case .quiz:
                        QuizView()
                    case .profile:
                        ProfileView(score: $score)
                    }
                    
                    Spacer()
                    
                    NavTabBar(selected: $selectedPage)
                        .frame(height: 76)
                }
                .frame(maxHeight: .infinity)
                
            }
        }
    }
}

#Preview {
    NavView()
}
