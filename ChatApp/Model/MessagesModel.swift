//
//  MessagesModel.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

struct Messages: Codable {
    let chats: [Chat]
}

struct Chat: Codable {
    let message: String
    let time: String
    let isMessageSendedByMainUser: Bool
}
