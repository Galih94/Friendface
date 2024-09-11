//
//  UserDetailView.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "testName", age: 20, company: "testCompany", email: "test@email.com", address: "testAddress", about: "testAbout", registered: "testRegistered", tags: [], friends: []))
}
