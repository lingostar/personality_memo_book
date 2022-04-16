//
//  PersonalityViewModel.swift
//  Persona Book
//
//  Created by peo on 2022/04/12.
//

import Foundation
import Combine

class PersonalityViewModel: ObservableObject {
    @Published var showPersonaViewModal = false
    
    @Published var personas = [Persona]()
    
    var personality: Personality = .ISTJ
    
    func loadPersonas(key: String) {
        if let encodedData = UserDefaults.standard.array(forKey: key) as? [Data] {
            self.personas = encodedData.map { try! JSONDecoder().decode(Persona.self, from: $0) }
        }
    }
    
    func addPersona(persona: Persona) {
        self.personas.insert(persona, at: 0)
        self.savePersonas()
    }
    
    func deletePersona(indexSet: IndexSet) {
        self.personas.remove(atOffsets: indexSet)
        self.savePersonas()
    }
    
    func savePersonas() {
        let data = self.personas.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: self.personality.title())
    }
}
