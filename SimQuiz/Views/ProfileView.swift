//
//  ProfileView.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @State var achievments : [String] = ["Complete the first level", "Finish the quiz", "Make a mistake 5 times", "Quit the quiz without finishing it", "Answer only one question correctly", "Spend 5 minutes in the quiz", "Get all the achievements"]

    
    @State private var image: UIImage?
    
    @State var selectImage = false
    @Binding var score : Int
    @State var achCount = 0
    var body: some View {
        ZStack{
            Color("#20232F").ignoresSafeArea()
            VStack{
                Text("Profile")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .leading)
                
                HStack{
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 98, height: 98)
                    
                    VStack{
                        
                        Text("Your score \(score)")
                            .frame(width: 221,height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("#353948"))
                            )
                        Text("Swap icon")
                            .foregroundStyle(.gray)
                            .frame(width: 221,height: 45)
                    }
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(width: 221, height: 98)
                }
                .frame(width: 343)
                
                VStack{
                    HStack{
                        Text("Achievments")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .frame(width: 250, alignment: .leading)
                        
                        Text("\(achCount)/7")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.leading)
                    }
                    .padding([.top, .horizontal])
                    ScrollView(.vertical) {
                        ForEach(achievments, id: \.self) { row in
                            HStack{
                                Text(row)
                                    .font(.system(size: 16))
                                
                                Spacer()
                                if UserDefaults.standard.bool(forKey: row) {
                                    Image("prof")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                }
                                else{
                                    Text("in progress")
                                        .font(.system(size: 12))
                                        .padding(5)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8).stroke(Color("#3780EF"))
                                        )
                                }
                            }
                            .padding(.horizontal)
                            .frame(minWidth: 311, minHeight: 48, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("#12141D"))
                            )
                        }
                    }
                    .frame(width: 255)
                }
                .frame(width: 343)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("#292B39"))
                )
                
                HStack{
                    Button {
                        //
                    } label: {
                        Text("Privacy Policy")
                            .frame(width: 163, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8).stroke(Color("#3780EF"))
                            )
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("Support")
                            .frame(width: 163, height: 45)
                            .background(
                                RoundedRectangle(cornerRadius: 8).stroke(Color("#3780EF"))
                            )
                    }
                    
                }
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 343)
                .padding(.vertical)
            }
            .onAppear{
                count()
            }
            .foregroundColor(.white)
        }
    }
    
    func count() {
        for i in achievments {
            if UserDefaults.standard.bool(forKey: i) == true {
                achCount += 1
            }
        }
        if achCount == 6 {
            UserDefaults.standard.setValue(true, forKey: "Get all the achievements")
            achCount = 7
        }
        
    }
}

#Preview {
    NavView(selectedPage: .profile)
}
