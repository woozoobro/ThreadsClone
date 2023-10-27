//
//  ActivityView.swift
//  ThreadsTutorials
//
//  Created by 우주형 on 2023/10/18.
//

import SwiftUI

struct ActivityView: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: DestinationView1(), isActive: $isActive) {
                    Text("Hello")
                }
                NavigationLink {
                    
                } label: {
                    
                }

                
                Text("16이상 네비게이션")
                    .navigationDestination(isPresented: $isActive) {
                        DestinationView2()
                    }
                
                Button("안녕안녕") {
                    isActive.toggle()
                }
            }
        }
    }
}

struct DestinationView1: View {
    init() {
        print("DestinationView1 만들어짐")
    }
    
    var body: some View {
        Text("Hello world")
    }
}
struct DestinationView2: View {
    init() {
        print("DestinationView2 만들어짐")
    }
    
    var body: some View {
        Text("Hello world")
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
