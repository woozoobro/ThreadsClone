//
//  PreviewProvider.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = DBUser(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "max")
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
