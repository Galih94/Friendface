//
//  ContentView.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\User.name)]) var users: [User]
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
                    UserDetailView(user: user, users: users)
                }
            }
        }
        .task {
            if users.isEmpty {
                do {
                    try modelContext.delete(model: User.self)
                    let fetchUsers = await NetworkHelper.loadData() ?? []
                    for user in fetchUsers {
                        modelContext.insert(user)
                    }
                } catch {
                    print("error -- \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
