//
//  DescriptionCell.swift
//  GetWork
//
//  Created by Max on 10/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel! 
    @IBOutlet weak var updatedLabel: UILabel!

    func setDescription(text: String){
        descriptionLabel.attributedText = try? NSAttributedString(htmlString: descriptionLabel.text! )
    }
}
