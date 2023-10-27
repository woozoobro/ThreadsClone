//
//  ProfileThreadFilter.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/18.
//

import SwiftUI

enum ProfileThreadFilter: CaseIterable, Hashable {
    case threads
    case replies
    
    var title: String {
        switch self {
            case .threads: return "Threads"
            case .replies: return "Replies"
        }
    }    
}
