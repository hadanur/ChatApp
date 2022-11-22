//
//  UserModel.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

struct Chats: Codable {
    let messages: [Message]
}

struct Message: Codable {
    let name: String
    let message: String
    let time: String
    let messageCount: String
}
