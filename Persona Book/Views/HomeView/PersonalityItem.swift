//
//  PersonalityItem.swift
//  Persona Book
//
//  Created by peo on 2022/04/11.
//

import SwiftUI

struct PersonalityItem: View {
    var personality: Personality
    @Binding var number: Int
    
    var body: some View {
        GroupBox {
            VStack(spacing: 0) {
                Text(personality.title())
                Text("\(number)")
                    .padding(.top, 10)
            }
            .padding(10)
        }
    }
}

struct PersonalityItem_Previews: PreviewProvider {
    static var previews: some View {
//        PersonalityItem(personality: .ESFJ)
        Text("")
    }
}
