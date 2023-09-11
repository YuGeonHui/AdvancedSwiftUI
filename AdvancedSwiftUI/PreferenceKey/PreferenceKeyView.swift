//
//  PreferenceKeyView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/11.
//

import SwiftUI

// 키를 가지고 접근
// 1. 키 등록: preferenceKey 프로토콜 준수
// 2. 하위뷰에서 값 송신: preference(key:value:) 메소드
// 3. 상위뷰에서 값 수신: onPreferenceChange() 메소드

struct PreferenceKeyView: View {
    
    @State private var text: String = "Hello, world!"
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyView()
    }
}

struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear { self.getDatFromDatabase() }
            .customTitle(newValue)
    }
    
    func getDatFromDatabase() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "New value from database"
        }
    }
}

// static 변수 defaultValue: Value
// static 함수 reduce(value: inout String, nextValue: () -> Value) 
struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
