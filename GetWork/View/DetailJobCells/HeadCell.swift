//
//  DescriptionTableViewCell.swift
//  GetWork
//
//  Created by Max on 10/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class HeadCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var vacancyNameLabel: UILabel!
    @IBOutlet weak var neededExpLabel: UILabel!
    @IBOutlet weak var employmentLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
