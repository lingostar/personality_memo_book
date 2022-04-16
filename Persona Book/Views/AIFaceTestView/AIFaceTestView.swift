//
//  AIFaceTestView.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

struct AIFaceTestView: View {
    var body: some View {
        NavigationView {
            VStack {
                GroupBox {
                    Text("곧 업데이트 예정입니다")
                        .padding()
                }
            }
            .navigationBarTitle("AI 관상 테스트")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct AIFaceTestView_Previews: PreviewProvider {
    static var previews: some View {
        AIFaceTestView()
    }
}
