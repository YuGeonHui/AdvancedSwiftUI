//
//  GeometryPreferenceKeyView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/11.
//

import SwiftUI

struct GeometryPreferenceKeyView: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            
            Text("Hello, world!")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            Spacer()
            
            HStack {
                Rectangle()
                
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
//                        .overlay(Text("\(geo.size.width)").foregroundColor(.white))
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

struct GeometryPreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyView()
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

extension View {
    
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        self.preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}
