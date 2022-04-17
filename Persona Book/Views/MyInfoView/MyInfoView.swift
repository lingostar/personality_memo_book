//
//  MeView.swift
//  Persona Book
//
//  Created by peo on 2022/04/17.
//

import SwiftUI

struct MyInfoView: View {
    @StateObject var viewModel = MyInfoViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        HStack {
                            Text("Name".localized())
                            Spacer()
                            Text(self.viewModel.userName)
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Text("Personality".localized())
                            Spacer()
                            Text(self.viewModel.userPersonality.personality.title())
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Persona".localized())
                        Spacer()
                        Text("\(self.viewModel.totalPersonaNumber)")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section(content: {
                    PersonalityListItem(realtionText: "SoulMate".localized(), personalityList: self.viewModel.userPersonality.personality.getSoulMateRelation())
                    PersonalityListItem(realtionText: "GoodRelationship".localized(), personalityList: self.viewModel.userPersonality.personality.getGoodRelation())
                    PersonalityListItem(realtionText: "BadRelationship".localized(), personalityList: self.viewModel.userPersonality.personality.getBadRelation())
                }, header: {
                    Text("RelationshipWithOP".localized())
                })
                
                Section {
                    Link("GoToTestPersonality".localized(), destination: URL(string: "https://www.16personalities.com")!)
                }
            }
            .navigationTitle("MyInfo".localized())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        self.viewModel.showPersonaViewModal = true
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: self.$viewModel.showPersonaViewModal) {
                        PersonaView(persona: Persona(name: self.viewModel.userName, personality: self.viewModel.userPersonality.personality), mode: .MY)
                    }
                }
            }
            .onAppear {
                self.viewModel.loadPersonas()
            }
        }
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
