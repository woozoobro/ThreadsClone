//
//  UserContentListViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/20.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: DBUser
    
    init(user:DBUser) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        self.threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
        
    }
}
