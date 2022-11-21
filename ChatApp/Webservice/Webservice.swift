//
//  Webservice.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import Foundation

class Webservice {
    
    func downloadChats(completion : @escaping (User?) -> ()) {
        
        let url = URL(string: "https://raw.githubusercontent.com/kadanur/HadanurRaM/main/list.json?token=GHSAT0AAAAAABZEF7X6MQDZ7EPBR3BKQTNUY34AG7Q")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let userList = try JSONDecoder().decode(User.self, from: data)
                    print(userList)
                    completion(userList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
