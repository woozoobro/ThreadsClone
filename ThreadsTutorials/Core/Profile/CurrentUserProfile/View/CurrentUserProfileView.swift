//
//  CurrentUserProfileView.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject private var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: viewModel.currentUser)
                    
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    if let user = viewModel.currentUser {
                        UserContentListView(user: user)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile) {
                if let user = viewModel.currentUser {
                    EditProfileView(user: user)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding(.horizontal)
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
