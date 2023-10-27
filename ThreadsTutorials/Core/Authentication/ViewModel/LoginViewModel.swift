//
//  LoginViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
