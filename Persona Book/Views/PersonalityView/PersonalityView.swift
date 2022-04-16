//
//  PersonalityView.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

struct PersonalityView: View {
    @StateObject var viewModel = PersonalityViewModel()
    var personality: Personality
    
    var body: some View {
        Form {
            Section(content: {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 0) {
                        ForEach(self.personality.getSoulMateRelation(), id: \.self) { eachPersonality in
                            GroupBox {
                                Text(eachPersonality.title())
                                    .font(.subheadline)
                            }
                            
                        }
                    }
                }
            }, header: {
                Text("천생연분")
            })
            
            Section(content: {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 0) {
                        ForEach(self.personality.getGoodRelation(), id: \.self) { eachPersonality in
                            GroupBox {
                                Text(eachPersonality.title())
                                    .font(.subheadline)
                            }
                            
                        }
                    }
                }
            }, header: {
                Text("좋은 관계")
            })
            
            Section(content: {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 0) {
                        ForEach(self.personality.getBadRelation(), id: \.self) { eachPersonality in
                            GroupBox {
                                Text(eachPersonality.title())
                                    .font(.subheadline)
                            }
                            
                        }
                    }
                }
            }, header: {
                Text("안맞아요")
            })
            
            Section(content: {
                ForEach(self.viewModel.personaNames, id: \.self) { name in
                    Text(name)
                }
                .onDelete(perform: self.deletePersona)
            }, header: {
                Text("페르소나 목록")
            })
        }
        .navigationBarTitle(personality.title())
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.viewModel.showPersonaViewModal = true
                }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: self.$viewModel.showPersonaViewModal) {
                    PersonaView(persona: Persona(name: "", personality: self.personality), mode: .NEW)
                }
            }
        }
    }
    private func deletePersona(at indexSet: IndexSet) {
        self.viewModel.personaNames.remove(atOffsets: indexSet)
    }
}

struct PersonalityView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityView(personality: .ESFJ)
    }
}
