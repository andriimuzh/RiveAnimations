//
//  BottomTabBar.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 14.06.2022.
//

import SwiftUI
import RiveRuntime

struct BottomTabBar: View {
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            item.icon.setInput("active", value: false)
                        }
                    } label: {
                        item.icon.view()
                            .frame(height: 46)
                    }
                }
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(
                color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(0.5), .white.opacity(0)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .padding(.horizontal, 24)
        }
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
}

var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER")),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL")),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"))
]



