//
//  SplashView.swift
//  Groot
//
//  Created by Nischal Niroula on 15/4/2024.
//

import SwiftUI

struct SplashView: View {
    var backgroundImage: String
    var logoImage: String
    var titleText: String
    var subtitleText: String
    var primaryColor: Color
    
    
    @State private var showingLoginScreen = false
    
    var body: some View {
        ZStack {
            // Background image
            Image(backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            // Adding a dark overlay for better text readability
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            // Main content
            VStack {
                Spacer()
                
                // Logo
                Image(logoImage)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 20)
                
                Spacer()
                VStack {
                    Text(titleText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(subtitleText)
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.bottom, 34)
                
                HStack {
                    
                    Spacer()
                    Button(action: {
                        showingLoginScreen = true
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding([.trailing, .top, .bottom])
                    }
                    .background(primaryColor)
                    .cornerRadius(14)
                    .padding(.horizontal)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .fullScreenCover(isPresented: $showingLoginScreen, onDismiss: nil) {
                                    LoginScreen()
                                }
                }
                .padding(.bottom, 50)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SwipableSplashScreen: View {
    var primaryColor = Color(red: 6 / 255.0, green: 69 / 255.0, blue: 106 / 255.0)

    var body: some View {
        TabView {
            SplashView(backgroundImage: "backgroundOne", logoImage: "GrootLogoWhite", titleText: "Cultural Crossroads", subtitleText: "Savor Authentic Flavors and Dive into Cultural Cuisine with Groot, Your Passport to Culinary Adventures.", primaryColor: primaryColor)
            
            SplashView(backgroundImage: "backgroundTwo", logoImage: "GrootLogoWhite", titleText: "Explore New Tastes", subtitleText: "Explore amazing new tastes and rich flavors that expand your palate beyond the horizon.", primaryColor: primaryColor)
            
            SplashView(backgroundImage: "backgroundThree", logoImage: "GrootLogoWhite", titleText: "Start Your Journey", subtitleText: "Begin your journey with us and discover the world through its food.", primaryColor: primaryColor)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
       
    }
}


#Preview {
    SwipableSplashScreen()
}
