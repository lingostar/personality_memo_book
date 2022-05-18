//
//  PersonalityList.swift
//  Persona Book
//
//  Created by peo on 2022/04/17.
//

import SwiftUI

struct PersonalityRelationshipItem: View {
    var realtionText: String
    var personalityList: [Personality]
    @State var showPersona = false
    @EnvironmentObject var viewModel: MainVM
    
    var body: some View {
        NavigationLink(destination:
            List(self.personalityList, id: \.self) { personality in
                HStack {
                    Button("\(personality.title)") {
                        self.showPersona.toggle()
                    }
                    .foregroundColor(.primary)
                    Spacer()
                    Text("\(self.viewModel.personas[personality.rawValue].count)")
                        .foregroundColor(.secondary)
                }
                .sheet(isPresented: self.$showPersona) {
                    NavigationView {
                        List(self.viewModel.personas[personality.rawValue]) { persona in
                            Text(persona.name)
                        }
                        .navigationBarTitle("PersonaList".localized())
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel".localized()) {
                                    self.showPersona.toggle()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(realtionText)
            .navigationBarTitleDisplayMode(.inline)
        ) {
            HStack {
                Text(realtionText)
                Spacer()
                Text("\(self.personalityList.count)")
                    .foregroundColor(.secondary)
            }
        }
    }
}
