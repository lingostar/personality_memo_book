//
//  PersonalityView.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

struct PersonalityView: View {
    var personality: Personality
    @State var showPersonaViewModal = false
    @EnvironmentObject var viewModel: MainVM
    
    var body: some View {
        Form {
            Section(content: {
                Text(self.viewModel.relationshipWithUser(personality: self.personality))
            }, header: {
                Text("RelationshipWithUser".localized())
            })
            
            // Show Relationship With Other Personalities
            Section(content: {
                PersonalityRelationshipItem(realtionText: "SoulMate".localized(), personalityList: self.personality.soulMate)
                PersonalityRelationshipItem(realtionText: "GoodRelationship".localized(), personalityList: self.personality.goodRelation)
                PersonalityRelationshipItem(realtionText: "BadRelationship".localized(), personalityList: self.personality.badRelation)
            }, header: {
                Text("RelationshipWithOP".localized())
            })
            
            // Show Added Persona List
            Section(content: {
                ForEach(self.viewModel.personas[self.personality.rawValue]) { persona in
                    Text(persona.name)
                }
                .onDelete { indexSet in
                    self.viewModel.deletePersona(at: indexSet, personality: self.personality)
                }
            }, header: {
                Text("PersonaList".localized())
            })
        }
        .navigationBarTitle(personality.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showPersonaViewModal = true
                }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: self.$showPersonaViewModal) {
                    PersonaView(persona: Persona(name: "", personality: self.personality), mode: .NEW)
                }
            }
        }
    }
}
