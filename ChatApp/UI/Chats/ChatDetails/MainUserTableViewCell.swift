//
//  MainUserTableViewCell.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import UIKit

class MainUserTableViewCell: UITableViewCell {
    @IBOutlet weak var mainUserView: UIView!
    @IBOutlet weak var mainUserMessageLabel: UILabel!
    @IBOutlet weak var mainUserMessageTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainUserView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
