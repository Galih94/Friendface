//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
