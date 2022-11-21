//
//  ChatsViewModel.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation
import UIKit

protocol ChatsVMDelegate {
    func fetchChatsOnSuccess()
    func fetchChatsOnUnSuccess()
}

class ChatsViewModel {
    let service = Webservice()
    var chats = [Messages]()
    var delegate: ChatsVMDelegate?
    
    let images = [UIImage(named: "billgates"),
                  UIImage(named: "elonmusk"),
                  UIImage(named: "fatihterim"),
                  UIImage(named: "muslera"),
                  UIImage(named: "mauroicardi"),
                  UIImage(named: "gomis"),
                  UIImage(named: "boey")]
    
    func fetchChats() {
        service.downloadChats { result in
            if let result = result {
                self.chats = result.messages
                self.delegate?.fetchChatsOnSuccess()
            } else {
                self.delegate?.fetchChatsOnUnSuccess()
            }
        }
    }
}
