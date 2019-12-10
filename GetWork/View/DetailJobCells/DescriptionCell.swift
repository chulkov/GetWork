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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionLabel.attributedText = try? NSAttributedString(htmlString: descriptionLabel.text! )
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
        // Configure the view for the selected state
    }
    
}

extension NSAttributedString {
    
    convenience init(htmlString html: String) throws {
        try self.init(data: Data(html.utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
    }
    
}
