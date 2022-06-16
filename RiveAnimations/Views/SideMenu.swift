//
//  SideMenu.swift
//  RiveAnimations
//
//  Created by Andrii Muzh on 15.06.2022.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State private var selectedMenu: SelectedMenu = .home
    @State private var isDarkMode = false
    
    var body: some View {
        VStack {
            userSection
            
            VStack (alignment: .leading, spacing: 0) {
                ForEach(menuItems) { item in
                    if menuItems.first?.id != item.id {
                        Rectangle()
                            .frame(height: 1)
                            .opacity(0.1)
                            .padding(.horizontal)
                    }
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
                
                Text("HISTORY")
                    .customFont(.footnote)
                    .padding(.top, 40)
                    .padding(.horizontal, 16)
                ForEach(menuItems2) { item in
                    if menuItems2.first?.id != item.id {
                        Rectangle()
                            .frame(height: 1)
                            .opacity(0.1)
                            .padding(.horizontal)
                    }
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
                
                Spacer()
                
                HStack {
                    menuItems3[0].icon.view()
                        .frame(width: 32, height: 32)
                        .opacity(0.6)
                        .onChange(of: isDarkMode) { newValue in
                            if newValue {
                                menuItems3[0].icon.setInput("active", value: true)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    menuItems3[0].icon.setInput("active", value: false)
                                }
                            } else {
                                menuItems3[0].icon.setInput("active", value: false)
                            }
                        }
                    Text(menuItems3[0].text)
                        .customFont(.headline)
                    Toggle("", isOn: $isDarkMode)
                }
                .padding(.leading, 12)
            }
            .padding(.leading, 8)
            .padding(.trailing, 16)

            
            Spacer()
        }
        .padding(.bottom)
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(.linearGradient(
            colors: [Color(hex: "#17203A"), Color(hex: "#394156")], startPoint: .top, endPoint: .bottom)
        )
        .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var userSection: some View {
        HStack {
            Image(systemName: "person")
                .padding(12)
                .background(.white.opacity(0.2))
                .mask(Circle())
            VStack (alignment: .leading, spacing: 2) {
                Text("Menu To")
                Text("UI Designer")
                    .customFont(.headline)
                    .customFont(.footnote2)
                    .opacity(0.5)
            }
            Spacer()
        }
        .padding()
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

let menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favourites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
    MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notifications)
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkMode)
]

enum SelectedMenu: String {
    case home
    case search
    case favourites
    case help
    case history
    case notifications
    case darkMode
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
