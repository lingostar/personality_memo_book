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
                    Text("SoonUpdate".localized())
                        .padding()
                }
            }
            .navigationBarTitle("AIFaceTest".localized())
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct AIFaceTestView_Previews: PreviewProvider {
    static var previews: some View {
        AIFaceTestView()
    }
}
