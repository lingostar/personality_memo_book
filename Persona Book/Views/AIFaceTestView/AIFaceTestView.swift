//
//  AIFaceTestView.swift
//  Persona Book
//
//  Created by peo on 2022/03/27.
//

import SwiftUI

struct AIFaceTestView: View {
    @State private var image: Image?
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
    @State private var currentImage: UIImage?
    
    
    @State var testLabel = ""
    
    private func testImage() {
        var model: maleTest
        do {
            model = try maleTest(configuration: .init())
            guard let img = UIImage(systemName: "star.fill"), let resizedImage = img.resizeTo(size: CGSize(width: 299, height: 299)), let buffer = resizedImage.toBuffer() else {
                return
            }
            let output = try? model.prediction(image: buffer)
            print(output)
            if let ouput = output {
                self.testLabel = ouput.classLabel
            }
        } catch {
        }
//        if let image = self.currentImage {
//            guard let resizedImage = image.resizeTo(size: CGSize(width: 299, height: 299)), let buffer = resizedImage.toBuffer() else {
//                return
//            }
//            let output = try? model.prediction(image: buffer)
//            if let ouput = output {
//                self.testLabel = ouput.classLabel
//                print("dfsfsdfasf")
//            }
//        }
        
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if self.image != nil {
                    image!
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                }
                
                HStack {
                    Button(action: {
                        self.testImage()
                    }) {
                        Text("Test".localized())
                    }
                    .padding(.trailing, 25)
                    
                    Button(action: {
                        self.shouldPresentActionScheet = true
                    }) {
                        Text("Upload".localized())
                    }
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker, currentImage: self.$currentImage)
                    }
                    .actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
                }
                .padding(.top, self.image != nil ? 30 : 0)
                
                Text(self.testLabel)
                    .font(.largeTitle)
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
