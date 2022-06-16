//
//  ContentView.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 09.06.2022.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State private var isOpen = false
    @State private var showOnboarding = false
    
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "#17203A"), Color(hex: "#394156")], startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
            Group {
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("search")
                case .timer:
                    Text("timer")
                case .bell:
                    Text("bell")
                case .user:
                    Text("user")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
            .offset(x: isOpen ? 250 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .scaleEffect(showOnboarding ? 0.92 : 1)
            .ignoresSafeArea()
            
            Image(systemName: "person")
                .frame(width: 36, height: 36)
                .background(.white)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showOnboarding.toggle()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .offset(y: 4)
                .offset(x: isOpen ? 100 : 0)
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            BottomTabBar()
                .offset(y: isOpen ? 150 : 0)
                .offset(y: showOnboarding ? 150 : 0)
                .opacity(isOpen ? 0 : 1)
            
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: showOnboarding ? -10 : 0)
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
