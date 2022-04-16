//
//  PersonaViewModel.swift
//  Persona Book
//
//  Created by peo on 2022/04/12.
//

import Foundation
import Combine

class PersonaViewModel: ObservableObject {
    @Published var persona: Persona
    
    var mode: PersonaViewMode
    
    @Published var isOn: Bool
    
    init() {
        self.persona = Persona(name: "", personality: .ISTP)
        self.mode = .MY
        self.isOn = false
    }
    
    var title: String {
        switch self.mode {
        case .NEW:
            return "AddPersona".localized()
        default:
            return "EditMyInfo".localized()
        }
    }
    
    func changeInfo(name: String, personality: Personality) {
        self.persona.name = name
        self.persona.personality = personality
    }
    
    func confirm() {
        switch self.mode {
        case .NEW:
            var personaList = [Persona]()
            if let encodedData = UserDefaults.standard.array(forKey: self.persona.personality.title()) as? [Data] {
                personaList = encodedData.map { try! JSONDecoder().decode(Persona.self, from: $0) }
            }
            personaList.insert(self.persona, at: 0)
            
            let data = personaList.map { try? JSONEncoder().encode($0) }
            UserDefaults.standard.set(data, forKey: self.persona.personality.title())
        default:
            UserDefaults.standard.set(self.persona.name, forKey: "name")
            UserDefaults.standard.set(self.persona.personality.rawValue, forKey: "personality")
        }
    }
    
    func clearName() {
        self.persona.name = ""
    }
}
