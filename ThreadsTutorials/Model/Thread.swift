//
//  Thread.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? UUID().uuidString
    }
    
    var user: DBUser?
}
