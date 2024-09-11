//
//  Friend.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import Foundation

struct Friend: Codable, Hashable {
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        lhs.id == rhs.id
    }
    let id: String
    let name: String
}
