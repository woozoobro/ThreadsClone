//
//  ExploreViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [DBUser]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
