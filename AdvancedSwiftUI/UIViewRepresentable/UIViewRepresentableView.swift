//
//  UIViewRepresentableView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/17.
//

import SwiftUI

// Convert a UIView from UIkit to SwiftUI
struct UIViewRepresentableView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            
            HStack {
                Text("SwiftUI: ")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                    .background(Color.gray)
            }
            
            HStack {
                Text("UIKit: ")
                UITextFieldViewRepresentable(text: $text)
                    .frame(height: 55)
                    .background(Color.gray)
            }
        }
    }
}

struct UIViewRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableView()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String

    func makeUIView(context: Context) -> some UIView {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func getTextField() -> UITextField {
        
        let textField = UITextField(frame: .zero)
        
        let placeholder = NSAttributedString(
            string: "Type here...",
            attributes: [.foregroundColor : UIColor.red
        ])
        
        textField.attributedPlaceholder = placeholder
//        textField.delegate
        return textField
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    
    // UIkit의 원소를 사용해서 만들 수 있다.
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
