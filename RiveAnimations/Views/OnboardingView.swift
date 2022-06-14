//
//  OnboardingView.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 09.06.2022.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State private var showModal = false
    @State private var dragAmount = CGFloat.zero
    
    var body: some View {
        ZStack {
            background
            content
                .offset(y: showModal ? -50 : 0)
            
            if showModal {
                Color("Shadow")
                    .opacity(0.4)
                    .ignoresSafeArea()
                SignInView(showModal: $showModal)
                    .offset(y: dragAmount)
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal = false
                            }
                            hideKeyboard()
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color:
                                            Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3
                                )
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: dragAmount)
                        .zIndex(1)
                    )
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onChanged({ value in
                                if value.translation.height > 0 {
                                    dragAmount = value.translation.height
                                    if value.translation.height > 150 {
                                        withAnimation(.spring()) {
                                            showModal = false
                                        }
                                        hideKeyboard()
                                        dragAmount = CGFloat.zero
                                    }
                                }
                            })
                            .onEnded({ value in
                                if value.translation.height < 150 {
                                    withAnimation(.spring()) {
                                        dragAmount = CGFloat.zero
                                    }
                                }
                            })
                    )
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
    
    var content: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .customFont(.title1)
                .frame(width: 260, alignment: .leading)
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    }
                }
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.caption)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
