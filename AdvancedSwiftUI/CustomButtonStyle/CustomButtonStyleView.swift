//
//  CustomButtonStyleView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/06.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct CustomButtonStyleView: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            
            Text("Click Me")
                .font(.headline)
                .withDefaultButtonFormatting()
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .cornerRadius(10)
//                .shadow(color: Color.blue.opacity(0.3),
//                        radius: 10, x: 0.0, y: 10)
        })
        .withPressableStyle(scaledAmount: 0.7)
//        .buttonStyle(PressableButtonStyle())
        .padding(40)
    }
}

struct CustomButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyleView()
    }
}
