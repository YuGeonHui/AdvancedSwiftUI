//
//  ScrollViewOffsetPreferenceKeyView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/11.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        defaultValue = nextValue()
    }
}

fileprivate extension View {
    
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
        
        self.background(
            GeometryReader { geo in
                Text("")
                    .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
            }
        )
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            action(value)
        }
    }
}

struct ScrollViewOffsetPreferenceKeyView: View {
    
    let title: String = "New title here!!!!"
    @State private var scrollViewOffset: CGFloat = 0.0
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75.0)
                    .onScrollViewOffsetChanged { value in
                        self.scrollViewOffset = value
                    }
                
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        .overlay(alignment: .top, content: {
            navBarLayer.opacity(scrollViewOffset < 40 ? 1.0 : 0.0)
        })
    }
}

struct ScrollViewOffsetPreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyView()
    }
}

extension ScrollViewOffsetPreferenceKeyView {
    
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.blue)
    }
}
