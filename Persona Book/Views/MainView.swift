//
//  MainView.swift
//  Persona Book
//
//  Created by peo on 2022/04/04.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case myInfo
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home".localized(), systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            MyInfoView()
                .tabItem {
                    Label("MyInfo".localized(), systemImage: "person.fill")
                }
                .tag(Tab.myInfo)
        }
    }
}
