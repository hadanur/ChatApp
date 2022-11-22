//
//  SecondUserTableViewCell.swift
//  ChatApp
//
//  Created by Hakan Adanur on 22.11.2022.
//

import UIKit

class SecondUserTableViewCell: UITableViewCell {
    @IBOutlet weak var secondUserView: UIView!
    @IBOutlet weak var secondUserMessageLabel: UILabel!
    @IBOutlet weak var secondUserMessageTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondUserView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
