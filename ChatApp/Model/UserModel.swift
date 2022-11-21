//
//  UserModel.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

struct User: Codable {
    let messages: [Messages]
}

struct Messages: Codable {
    let name: String
    let text: String
    let time: String
    let messageCount: String
}
