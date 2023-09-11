//
//  CustomTabBarContainerView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/11.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .orange),
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
