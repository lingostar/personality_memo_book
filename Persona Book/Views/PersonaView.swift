//
//  MyView.swift
//  Persona Book
//
//  Created by peo on 2022/04/11.
//

import SwiftUI

struct PersonaView: View {
    @State var persona: Persona
    var mode: PersonaViewMode
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var viewModel: MainVM
    
    var body: some View {
        NavigationView {
            List {
                // Input Name When Adding Persona
                if self.mode == .NEW {
                    Section {
                        HStack {
                            Text("Name".localized())
                                .padding(.trailing, 45)
                            
                            HStack {
                                TextField("InputName".localized(), text: self.$persona.name)
                                    .disableAutocorrection(true)
                                
                                if !self.persona.name.isEmpty {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .onTapGesture {
                                            self.persona.name = ""
                                        }
                                }
                            }
                        }
                    }
                }
                
                // Choose Personality
                Section {
                    Picker("Personality".localized(), selection: self.$persona.personality) {
                        ForEach(0..<16, id: \.self) { index in
                            Text("\(index.personality.title)")
                                .tag(index.personality)
                        }
                    }
                }
            }
            .navigationTitle(self.mode.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Cancel".localized())
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        Task {
                            switch self.mode {
                            case .NEW:
                                await self.viewModel.addPersona(persona: self.persona)
                                self.viewModel.personas[self.persona.personality.rawValue].insert(self.persona, at: 0)
                            default :
                                self.viewModel.userPersonality = self.persona.personality.rawValue
                            }
                        }
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Done".localized())
                    }
                    .disabled(self.mode == .NEW && self.persona.name.isEmpty)
                }
            }
        }
    }
}

enum PersonaViewMode: Identifiable {
    case MY
    case NEW
    
    var id: Int {
        hashValue
    }
    
    var title: String {
        switch self {
        case .NEW:
            return "AddPersona".localized()
        case .MY:
            return "EditMyInfo".localized()
        }
    }
}
