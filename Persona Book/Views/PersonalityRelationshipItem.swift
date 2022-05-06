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
    
    var body: some View {
        NavigationLink(destination:
            List(self.personalityList, id: \.self) { personality in
                Text(personality.title)
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
