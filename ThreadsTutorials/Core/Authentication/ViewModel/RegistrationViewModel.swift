//
//  RegistrationViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
