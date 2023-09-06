//
//  ViewModifierView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/06.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgorundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgorundColor))
    }
}

struct ViewModifierView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("Hello, World!")
                .font(.headline)
                .withDefaultButtonFormatting(backgorundColor: .orange)
            
            Text("Hello, everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting()
            
            Text("Hello!!")
                .font(.title)
                .modifier(DefaultButtonViewModifier(backgroundColor: .pink))
            
        }
        .padding()
    }
}

struct ViewModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierView()
    }
}
