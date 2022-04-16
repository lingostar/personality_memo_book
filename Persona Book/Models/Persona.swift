//
//  Persona.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import Foundation

struct Persona: Codable, Hashable, Identifiable {
    var name: String
    var personality: Personality
    var id = UUID()
}
