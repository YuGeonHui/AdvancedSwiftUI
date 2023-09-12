//
//  TabBarItem.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/12.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable, CaseIterable {
    
    case home
    case favorites
    case profile
    case message
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        case .message: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .message: return "Messages"
        }
    }
    
    var color: Color {
        
        switch self {
        case .home: return .red
        case .favorites: return .blue
        case .profile: return .green
        case .message: return .orange
        }
    }
}
