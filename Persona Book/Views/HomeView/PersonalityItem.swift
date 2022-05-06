//
//  PersonalityItem.swift
//  Persona Book
//
//  Created by peo on 2022/04/11.
//

import SwiftUI

struct PersonalityItem: View {
    var personality: Personality
    @State var number: Int = -1
    @EnvironmentObject var viewModel: MainVM
    
    var body: some View {
        VStack(spacing: 0) {
            Text(self.personality.title)
                .bold()
                .padding(.horizontal, 30)
            
            Text("\(self.number)")
                .font(.subheadline)
                .padding(.top, 10)
        }
        .padding(.vertical, 20)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(10)
        .task {
            Task {
                self.number = self.viewModel.personas[self.personality.rawValue].count
            }
        }
    }
}
