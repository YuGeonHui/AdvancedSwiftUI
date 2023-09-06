//
//  CustomAnyTransitionView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/06.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    
    static var roatating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static func roatating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var roatateOn: AnyTransition {
        asymmetric(
            insertion: .roatating,
            removal: .move(edge: .leading))
    }
}

struct CustomAnyTransitionView: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.roatateOn)
//                    .transition(AnyTransition.roatating(rotation: 1080))
//                    .transition(AnyTransition.roatating.animation(.easeInOut))
//                    .transition(.move(edge: .leading))
//                    .modifier(RotateViewModifier(rotation: 45))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
            }
            
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomAnyTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnyTransitionView()
    }
}
