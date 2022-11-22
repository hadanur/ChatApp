//
//  ChatDetailsViewController.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import UIKit

class ChatDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ChatDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel.delegate = self
        viewModel.fetchMessages()
        self.title = viewModel.selectedUser?.name
    }
}

extension ChatDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secondUserCell = tableView.dequeueReusableCell(withIdentifier: "SecondUserTableViewCell") as! SecondUserTableViewCell
        
        let mainUserCell = tableView.dequeueReusableCell(withIdentifier: "MainUserTableViewCell") as! MainUserTableViewCell
        
        let data = viewModel.chats[indexPath.row]
        
        if viewModel.chats[indexPath.row].isMessageSendedByMainUser == true {
            mainUserCell.selectionStyle = .none
            mainUserCell.mainUserMessageLabel.text = data.message
            mainUserCell.mainUserMessageTime.text = data.time
            return mainUserCell

        } else {
            secondUserCell.selectionStyle = .none
            secondUserCell.secondUserMessageLabel.text = data.message
            secondUserCell.secondUserMessageTimeLabel.text = data.time
            return secondUserCell

        }
    }
}

extension ChatDetailsViewController: ChatDetailsVMDelegate {
    
    func fetchMessagesOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchMessagesOnUnSuccess() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "No internet!")
        }
    }
    
    
}
