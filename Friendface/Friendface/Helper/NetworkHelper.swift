//
//  NetworkHelper.swift
//  Friendface
//
//  Created by Galih Samudra on 11/09/24.
//

import Foundation

enum NetworkHelper {
    static func loadData() async -> [User]? {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("invalid URL")
            return nil
        }
        do {
            let (data, metaData) = try await URLSession.shared.data(from: url)
            print("meta data: \(metaData.debugDescription)")
            
            guard let decodeResponse = try? JSONDecoder().decode([User].self, from: data) else { return nil }
            print("results: \(decodeResponse)")
            return decodeResponse
            
        } catch {
            print("invalid data - \(error.localizedDescription)")
            return nil
        }
    }
}
