//
//  ConversationsListViewCell.swift
//  finctechAfter
//
//  Created by Денис Сидоренко on 27/08/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class ConversationsListViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
