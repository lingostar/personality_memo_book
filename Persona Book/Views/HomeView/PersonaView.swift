//
//  MyView.swift
//  Persona Book
//
//  Created by peo on 2022/04/11.
//

import SwiftUI

struct PersonaView: View {
    @StateObject var viewModel = PersonaViewModel()
    @Environment(\.presentationMode) var presentation
    var persona: Persona
    var mode: PersonaViewMode
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("이름")
                            .padding(.trailing, 40)
                        ZStack(alignment: .trailing) {
                            TextField("이름을 입력하세요", text: self.$viewModel.persona.name)
                            if !self.viewModel.persona.name.isEmpty {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .onTapGesture {
                                        self.viewModel.clearName()
                                    }
                            }
                        }
                    }
                }
                
                Section {
                    Picker("성격 유형", selection: self.$viewModel.persona.personality) {
                        ForEach(personalityTypes.indices, id: \.self) {
                            Text("\(personalityTypes[$0])")
                                .tag($0.personality)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle(self.viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        self.viewModel.confirm()
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("완료")
                    }
                    .disabled(self.viewModel.persona.name.isEmpty)
                }
            }
            .onAppear {
                if !self.viewModel.isOn {
                    self.viewModel.changeInfo(name: self.persona.name, personality: self.persona.personality)
                    self.viewModel.mode = self.mode
                    self.viewModel.isOn = true
                }
            }
        }
    }
}

struct PersonaView_Previews: PreviewProvider {
    static var previews: some View {
//        PersonaView()
        Text("")
    }
}

enum PersonaViewMode: Identifiable {
    case MY
    case NEW
    
    var id: Int {
        hashValue
    }
}
