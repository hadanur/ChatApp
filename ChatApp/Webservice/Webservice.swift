//
//  Webservice.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

class Webservice {
    
    func downloadChats(completion : @escaping (Chats?) -> ()) {
        
        let url = URL(string: "https://raw.githubusercontent.com/hadanur/PL/adsadada/data.json")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let userList = try JSONDecoder().decode(Chats.self, from: data)
                    print(userList)
                    completion(userList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
    
    func downloadMessages(completion : @escaping (Messages?) -> ()) {
        
        let url = URL(string: "https://raw.githubusercontent.com/hadanur/ChatApp/main/data?token=GHSAT0AAAAAAB2MFPBK52MAOM4BVYQSCHFWY35CAVA")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let messageList = try JSONDecoder().decode(Messages.self, from: data)
                    print(messageList)
                    completion(messageList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
