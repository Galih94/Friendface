//
//  ContentView.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink(value: user) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(user.name)
                        Text(user.isActive ? "Active" : "Not Active")
                            .foregroundStyle(user.isActive ? .green : .red)
                            
                    }
                }
                .navigationDestination(for: User.self) { user in
                    UserDetailView(user: user)
                }
            }
        }
        .task {
            if users.isEmpty {
                users = await NetworkHelper.loadData() ?? []
            }
        }
    }
}

#Preview {
    ContentView()
}
