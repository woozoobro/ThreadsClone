//
//  ThreadsTextFieldModifier.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/18.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
