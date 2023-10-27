//
//  UserService.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: DBUser?    
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: DBUser.self)
        self.currentUser = user
        print("DEBUG: User is \(user)")
    }
    
    static func fetchUsers() async throws -> [DBUser] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: DBUser.self) })
        return users.filter({ $0.id != currentUid})
    }
    
    static func fetchUser(withUid uid: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: DBUser.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl" : imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
