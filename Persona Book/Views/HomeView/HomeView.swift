//
//  HomeView.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

struct HomeView: View {
    let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20),
    ]
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns,  spacing: 20) {
                    ForEach(0..<16, id: \.self) { index in
                        NavigationLink(destination: PersonalityView(personality: index.personality), isActive: self.$viewModel.isOn[index]) {
                            PersonalityItem(personality: index.personality, number: self.$viewModel.personaNumbers[index])
                                .onTapGesture {
                                    self.viewModel.isOn[index] = true
                                }
                        }
                        .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 5)
            }
            .padding(.horizontal, 20)
            .navigationTitle("Home".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        self.viewModel.showPersonaViewModal = true
                    }) {
                        Image(systemName: "person")
                    }
                    .sheet(isPresented: self.$viewModel.showPersonaViewModal) {
                        PersonaView(persona: Persona(name: self.viewModel.userName, personality: self.viewModel.userPersonality.personality), mode: .MY)
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.loadPersonas()
        }
        .onChange(of: self.viewModel.isOn) { _ in
            self.viewModel.loadPersonas()
        }
        .searchable(text: self.$viewModel.searchText, placement: .toolbar, prompt: "InputPersonaName".localized()) {
            ForEach(self.viewModel.allPersona) { persona in
                HStack {
                    Text(persona.name)
                    Spacer()
                    Text(persona.personality.title())
                        .foregroundColor(.secondary)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.viewModel.isOn[persona.personality.rawValue] = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

