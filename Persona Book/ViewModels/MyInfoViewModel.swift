//
//  MyInfoViewModel.swift
//  Persona Book
//
//  Created by peo on 2022/04/17.
//

import Foundation

class MyInfoViewModel: ObservableObject {
    
    @Published var userName: String = (UserDefaults.standard.string(forKey: "name") ?? "")
    @Published var userPersonality: Int = UserDefaults.standard.integer(forKey: "personality")
    
    @Published var showPersonaViewModal = false {
        willSet {
            self.userName = (UserDefaults.standard.string(forKey: "name") ?? "")
            self.userPersonality = UserDefaults.standard.integer(forKey: "personality")
        }
    }
    
    @Published var totalPersonaNumber = 0
    
    func loadPersonas() {
        self.totalPersonaNumber = 0
        for personality in Personality.allCases {
            if let encodedData = UserDefaults.standard.array(forKey: personality.title()) as? [Data] {
                self.totalPersonaNumber += encodedData.count
            }
        }
    }
}
