//
//  GenericView.swift
//  AdvancedSwiftUI
//
//  Created by geonhui Yu on 2023/09/07.
//

import SwiftUI

struct StringModel {
    let info: String?
    func removeInfo() -> Self {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    func removeInfo() -> Self {
        BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> Self {
        GenericModel(info: nil)
    }
}

struct GenericTitleView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content.background(.red)
        }
    }
}

class GenericViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, world!")
    @Published var boolModel = BoolModel(info: true)
    
    @Published var genericStringModel = GenericModel(info: "Hello, world!")
    @Published var genericboolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        
        genericStringModel = genericStringModel.removeInfo()
        genericboolModel = genericboolModel.removeInfo()
    }
}

struct GenericView: View {
    
    @StateObject private var viewModel = GenericViewModel()
    
    var body: some View {
        VStack {
            
            GenericTitleView(content: Text("custom View"), title: "new View!")
            
            Text(viewModel.stringModel.info ?? "no data")
            
            Text(viewModel.boolModel.info?.description ?? "no data")
            
            Text(viewModel.genericStringModel.info ?? "no data")
            
            Text(viewModel.genericboolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

struct GenericView_Previews: PreviewProvider {
    static var previews: some View {
        GenericView()
    }
}
