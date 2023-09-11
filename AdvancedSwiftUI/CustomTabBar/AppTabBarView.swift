//
//  AppTabBarView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/11.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    
    var body: some View {
        TabView(selection: $selection) {
            
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}
