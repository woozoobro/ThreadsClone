//
//  ProfileViewModel.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: DBUser?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
        
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)
    }
    
    
}
