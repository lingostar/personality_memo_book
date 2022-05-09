//
//  MeView.swift
//  Persona Book
//
//  Created by peo on 2022/04/17.
//

import SwiftUI

struct MyInfoView: View {
    @EnvironmentObject var viewModel: MainVM
    @State var showPersonaViewModal = false
    
    var body: some View {
        NavigationView {
            Form {
                // Show My Personality
                Section {
                    List {
                        HStack {
                            Text("Personality".localized())
                            Spacer()
                            Text(self.viewModel.userPersonality.personality.title)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                // Show Number Of Added Personas
                Section {
                    HStack {
                        Text("Persona".localized())
                        Spacer()
                        Text("\(self.viewModel.numberOfPersonas)")
                            .foregroundColor(.secondary)
                    }
                }
                
                // Show Relationship With Other Personalities
                Section(content: {
                    PersonalityRelationshipItem(realtionText: "SoulMate".localized(), personalityList: self.viewModel.userPersonality.personality.soulMate)
                    PersonalityRelationshipItem(realtionText: "GoodRelationship".localized(), personalityList: self.viewModel.userPersonality.personality.goodRelation)
                    PersonalityRelationshipItem(realtionText: "BadRelationship".localized(), personalityList: self.viewModel.userPersonality.personality.badRelation)
                }, header: {
                    Text("RelationshipWithOP".localized())
                })
                
                // Link To Test
                Section {
                    Link("GoToTestPersonality".localized(), destination: URL(string: "https://www.16personalities.com")!)
                }
            }
            .navigationTitle("MyInfo".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        self.showPersonaViewModal = true
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: self.$showPersonaViewModal) {
                        PersonaView(persona: Persona(name: "", personality: self.viewModel.userPersonality.personality), mode: .MY)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
