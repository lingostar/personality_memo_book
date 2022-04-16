//
//  HomeViewModel.swift
//  Persona Book
//
//  Created by peo on 2022/04/12.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchText = "" {
        didSet {
            self.filteredPersona = self.allPersona.filter { persona in
                if self.searchText.isEmpty {
                    return true
                }
                return persona.name.contains(self.searchText)
            }
        }
    }
    @Published var isRelation = false
    @Published var showPersonaViewModal = false {
        willSet {
            self.userName = (UserDefaults.standard.string(forKey: "name") ?? "")
            self.userPersonality = UserDefaults.standard.integer(forKey: "personality")
        }
    }
    
    @Published var showPersonalityView = false
    
    var userName: String = (UserDefaults.standard.string(forKey: "name") ?? "")
    var userPersonality: Int = UserDefaults.standard.integer(forKey: "personality")
    
    @Published var isOn = [Bool](repeating: false, count: 16)
    
    @Published var allPersona = [Persona(name: "one", personality: .ISTP),
                                 Persona(name: "two", personality: .ISTP),
                                 Persona(name: "three", personality: .INFJ),
                                 Persona(name: "four", personality: .ISTP),
                                 Persona(name: "five", personality: .ISTJ),
    ]
    
    @Published var filteredPersona = [Persona(name: "one", personality: .ENTJ)]
}
