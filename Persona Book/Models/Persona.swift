//
//  Persona.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import Foundation

struct Persona: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var personality: Personality
    
    static var all: [[Persona]] {
        get async {
            var allPersona: [[Persona]] = [[Persona]](repeating: [], count: 16)
            for personality in Personality.allCases {
                if let encodedData = UserDefaults.standard.array(forKey: personality.title) as? [Data] {
                    allPersona[personality.rawValue] = encodedData.map { try! JSONDecoder().decode(Persona.self, from: $0) }
                }
            }
            return allPersona
        }
    }
    
    func addToAll() async {
        var personaList: [Persona] = await Persona.all[self.personality.rawValue]
        personaList.insert(self, at: 0)

        let data = personaList.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: self.personality.title)
    }
}
