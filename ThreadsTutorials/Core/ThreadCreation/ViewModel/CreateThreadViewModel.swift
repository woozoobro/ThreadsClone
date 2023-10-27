//
//  CreateThreadViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    @Published var caption = ""
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}

