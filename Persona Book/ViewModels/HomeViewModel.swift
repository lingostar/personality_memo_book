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
            self.loadPersonas()
            self.allPersona = self.allPersona.filter { persona in
                if self.searchText.isEmpty {
                    return true
                }
                return persona.name.contains(self.searchText)
            }
        }
    }
    
    @Published var showPersonalityView = false
    
    @Published var isOn = [Bool](repeating: false, count: 16)
    
    @Published var allPersona = [Persona]()
    
    @Published var personaNumbers = [Int](repeating: 0, count: 16)
    
    func loadPersonas() {
        self.allPersona = []
        for personality in Personality.allCases {
            if let encodedData = UserDefaults.standard.array(forKey: personality.title()) as? [Data] {
                self.allPersona += encodedData.map { try! JSONDecoder().decode(Persona.self, from: $0) }
                personaNumbers[personality.rawValue] = encodedData.count
            }
        }
    }
}
