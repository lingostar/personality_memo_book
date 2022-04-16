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
    
    @Published var personaNames = ["one", "two", "three"]
}
