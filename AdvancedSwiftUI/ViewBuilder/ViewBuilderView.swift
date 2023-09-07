//
//  ViewBuilderView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/07.
//

import SwiftUI

// 해당뷰에 프로퍼티가 늘어날때마다 생기는 문제가 발생
struct HeaderViewReulgar: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// Generic과 ViewBuilder를 사용하여 해결해보기
struct HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderView: View {
    
    var body: some View {
        
        VStack {
            
            HeaderViewReulgar(title: "New Title", description: "Hello", iconName: "heart.fill")
            
            HeaderViewReulgar(title: "Another Title", description: nil, iconName: nil)
            
            HeaderViewGeneric(title: "Generic Title") {
                Text("Hello")
            }
            
            CustomHStack {
                Text("Hi")
                Text("Hi")
                Text("Hi")
            }
            
            Spacer()
        }
    }
}

struct ViewBuilderView_Previews: PreviewProvider {
    static var previews: some View {
//        ViewBuilderView()
        LocalViewBuilder(type: .two)
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
       
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one: viewOne
        case .two: viewTwo
        case .three: viewThree
        }
    }
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("Two!")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
