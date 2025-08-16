//
//  PreviewHelper.swift
//  OneStep
//
//  Created by Lucid on 8/17/25.
//

import SwiftUI


// Preview에서 Binding값 사용가능
struct StatefulPreviewWrapper<Value, Content: View>: View {
    
    @State private var value: Value
    
    private let content: (Binding<Value>) -> Content
    
    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}

