//
//  ViewController.swift
//  ChatApp
//
//  Created by Hakan Adanur on 21.11.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SDWebImage
import MessageKit
import GoogleSignIn

class ChatsViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ChatsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchChats()
    }
}

extension ChatsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatsTableViewCell") as! ChatsTableViewCell
        let data = viewModel.chats[indexPath.row]
        cell.selectionStyle = .none
        cell.nameLabel.text = data.name
        cell.messageLabel.text = data.text
        cell.userImage.image = viewModel.images[indexPath.row]
        
        if data.messageCount == "0" {
            cell.countView.isHidden = true
        } else {
            cell.countView.isHidden = false
            cell.countLabel.text = data.messageCount
        }

        cell.timeLabel.text = data.time
        return cell
    }
}

extension ChatsViewController: ChatsVMDelegate {
    
    func fetchChatsOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchChatsOnUnSuccess() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "No internet!")
        }
    }
}
