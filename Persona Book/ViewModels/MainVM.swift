//
//  DataVM.swift
//  Persona Book
//
//  Created by peo on 2022/05/05.
//

import Foundation

final class MainVM: ObservableObject {
    @Published var personas: [[Persona]] = [[Persona]](repeating: [], count: 16) {
        didSet {
            self.filteredPersonas = self.personas
        }
    }
    
    @Published var filteredPersonas: [[Persona]] = [[Persona]](repeating: [], count: 16)
    
    @Published var userPersonality: Int = UserDefaults.standard.integer(forKey: "personality") {
        willSet {
            UserDefaults.standard.set(newValue, forKey: "personality")
        }
    }
    
    @Published var numberOfPersonas = 0
    
    func addPersona(persona: Persona) async {
        await persona.addToAll()
        self.numberOfPersonas += 1
    }

    func deletePersona(at indexSet: IndexSet, personality: Personality) {
        self.personas[personality.rawValue].remove(atOffsets: indexSet)
        self.numberOfPersonas -= 1
        
        let personaList: [Persona] = self.personas[personality.rawValue]
        let data = personaList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: personality.title)
    }
    
    func relationshipWithUser(personality: Personality) -> String {
        if personality.soulMate.contains(self.userPersonality.personality) {
            return "SoulMate".localized()
        } else if personality.goodRelation.contains(self.userPersonality.personality) {
            return "GoodRelationship".localized()
        } else if personality.badRelation.contains(self.userPersonality.personality){
            return "BadRelationship".localized()
        } else {
            return "Normal".localized()
        }
    }
}
