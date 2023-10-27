//
//  User.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Foundation

struct DBUser: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
