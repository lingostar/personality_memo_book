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
        case test
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            AIFaceTestView()
                .tabItem {
                    Label("테스트", systemImage: "face.smiling.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}