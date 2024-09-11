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
            Text(user.name)
        }
        .task {
            users = await NetworkHelper.loadData() ?? []
        }
    }
}

#Preview {
    ContentView()
}
