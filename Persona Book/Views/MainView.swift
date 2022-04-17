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
        case myInfo
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home".localized(), systemImage: "house.fill")
                }
                .tag(Tab.home)

//            AIFaceTestView()
//                .tabItem {
//                    Label("Test".localized(), systemImage: "face.smiling.fill")
//                }
//                .tag(Tab.test)
            MyInfoView()
                .tabItem {
                    Label("MyInfo".localized(), systemImage: "person.fill")
                }
                .tag(Tab.myInfo)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
