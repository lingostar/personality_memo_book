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
        self.persona = Persona(name: "홍길동", personality: .ISTP)
        self.mode = .MY
        self.isOn = false
    }
    
    var title: String {
        switch self.mode {
        case .NEW:
            return "페르소나 추가"
        default:
            return "내 정보 수정"
        }
    }
    
    func changeInfo(name: String, personality: Personality) {
        self.persona.name = name
        self.persona.personality = personality
    }
    
    func confirm() {
        switch self.mode {
        case .NEW:
            print("")
        default:
            UserDefaults.standard.set(self.persona.name, forKey: "name")
            UserDefaults.standard.set(self.persona.personality.rawValue, forKey: "personality")
        }
    }
    
    func clearName() {
        self.persona.name = ""
    }
}
