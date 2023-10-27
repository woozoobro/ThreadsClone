//
//  ExploreView.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/18.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = ExploreViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: DBUser.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
