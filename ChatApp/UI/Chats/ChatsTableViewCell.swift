//
//  ChatsTableViewCell.swift
//  ChatApp
//
//  Created by Hakan Adanur on 21.11.2022.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    @IBOutlet weak var chatsView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 30
        countView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
