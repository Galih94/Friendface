//
//  UserDetailView.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var users: [User]
    var body: some View {
        Form {
            Section("User") {
                Text(user.name)
                Text("\(user.age)")
                Text(user.isActive ? "Active" : "Not Active")
                    .foregroundStyle(user.isActive ? .green : .red)
            }
            Section("Bio") {
                Text(user.email)
                Text(user.getRegisteredDate() ?? "N/A")
                Text(user.company)
            }
            Section("Tags") {
                Text(user.tags.joined(separator: ", "))
            }
            Section("About") {
                Text(user.about)
            }
            Section("Friend") {
                List(user.friends, id: \.id) {friend in
                    Text(friend.name)
                }
            }
        }
        
    }
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "testName", age: 20, company: "testCompany", email: "test@email.com", address: "testAddress", about: "testAbout", registered: "testRegistered", tags: [], friends: []), users: [])
}
