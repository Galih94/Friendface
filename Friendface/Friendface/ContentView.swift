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
        List(users, id: \.id) { user in
            VStack(alignment: .leading, spacing: 6) {
                Text(user.name)
                Text(user.isActive ? "Active" : "Not Active")
                    .foregroundStyle(user.isActive ? .green : .red)
                    
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
