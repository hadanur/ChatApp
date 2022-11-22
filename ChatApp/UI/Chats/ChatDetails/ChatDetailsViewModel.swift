//
//  ChatsViewModel.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

protocol ChatDetailsVMDelegate {
    func fetchMessagesOnSuccess()
    func fetchMessagesOnUnSuccess()
}

class ChatDetailsViewModel {
    let service = Webservice()
    var chats = [Chat]()
    var delegate: ChatDetailsVMDelegate?
    var selectedMessage: Message?
    
    func fetchMessages() {
        service.downloadMessages { result in
            if let result = result {
                self.chats = result.chats
                self.delegate?.fetchMessagesOnSuccess()
            } else {
                self.delegate?.fetchMessagesOnUnSuccess()
            }
        }
    }
}
