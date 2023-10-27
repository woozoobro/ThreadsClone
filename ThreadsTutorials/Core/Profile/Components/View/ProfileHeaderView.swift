//
//  ProfileHeaderView.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/19.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: DBUser?
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
