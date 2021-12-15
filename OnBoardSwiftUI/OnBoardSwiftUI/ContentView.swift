//
//  ContentView.swift
//  OnBoardSwiftUI - Netflix
//

//MARK:  Created by Shreyas Vilaschandra Bhike on 15/12/21.
//MARK:  The App Wizard
//MARK:  Instagram : theappwizard2408

import SwiftUI


struct ContentView: View {
    
@State var splashScreen  = true

var body: some View {
     ZStack{
        Group{
          if splashScreen {
                SplashScreen()
           }
          else{
              MainView()
                }
            }
           .onAppear {
              DispatchQueue
                   .main
                   .asyncAfter(deadline:
                    .now() + 4) {
               self.splashScreen = false
              }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct MainView: View {
    
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.8)
           }
    
    @State var selectedPage = 0
    var body: some View {
        
        // Main Stack
       
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            if (selectedPage == 0)
            {
                Image("screen")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                
                Image("gradient")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                   
            }
            
            
            
            VStack{
          
                
                ZStack{
                TabView(selection: $selectedPage)
                {
                    ForEach(0..<testData.count){
                        index in CardView(card : testData[index]).tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                }.offset(x: 0, y: 20)
                
             
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 380, height: 75)
                        .foregroundColor(Color("buttonbg"))
                        .padding(20)
                    
                    Text("SIGN IN")
                        .fontWeight(.regular)
                        .font(.system(size: 26))
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        
                }
            }
            
            if (selectedPage == 1){
               TopNav()
            }
            if (selectedPage == 2){
                TopNav()
            }
            if (selectedPage == 3){
                TopNav()
            }
        }
       
    }
}


//MARK: Netflix Splash Screen
struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            LottieView(filename: "netflix")
        }
    }
}


//MARK: Top Navigation Bar for Pages 1 , 2 , 3
struct TopNav: View {
    var body: some View {
        ZStack{
            HStack{
                Image("netflixlogo")
                    .resizable()
                    .frame(width: 110, height: 62)
                
                Spacer()
                
                Text("Help")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                Spacer().frame(width : 10)
                   
                
                Text("Privacy")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                 
            }
            .offset(x: 0, y: -395)
            .padding()
        }
    }
}


