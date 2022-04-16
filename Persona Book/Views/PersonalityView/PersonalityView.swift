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
    @State var tempPersona = Persona(name: "", personality: .ISTJ)
    
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
                Text("SoulMate".localized())
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
                Text("GoodRelation".localized())
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
                Text("BadRelation".localized())
            })
            
            Section(content: {
                ForEach(self.viewModel.personas) { persona in
                    Text(persona.name)
                }
                .onDelete(perform: self.deletePersona)
            }, header: {
                Text("PersonaList".localized())
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
        .onAppear {
            self.viewModel.personality = self.personality
            self.viewModel.loadPersonas(key: self.personality.title())
        }
        .onChange(of: self.viewModel.showPersonaViewModal) { value in
            if !value {
                self.viewModel.loadPersonas(key: self.personality.title())
            }
        }
    }
    private func deletePersona(at indexSet: IndexSet) {
        self.viewModel.deletePersona(indexSet: indexSet)
    }
}

struct PersonalityView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityView(personality: .ESFJ)
    }
}
