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
    var messages = [Message]()
    var delegate: ChatsVMDelegate?
    var choosenUser: Message?
    
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
                self.messages = result.messages
                self.delegate?.fetchChatsOnSuccess()
            } else {
                self.delegate?.fetchChatsOnUnSuccess()
            }
        }
    }
}
