//
//  User.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import Foundation

struct User: Codable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
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
    
    func getRegisteredDate() -> String? {
        return ISO8601DateFormatter().date(from: registered)?.formatted(date: .abbreviated, time: .complete)
    }
}
