//
//  User.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import Foundation

struct User {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}
