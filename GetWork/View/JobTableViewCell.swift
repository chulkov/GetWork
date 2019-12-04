//
//  JobTableViewCell.swift
//  GetWork
//
//  Created by Max on 04/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setDescription(textDescription: String, trim number: Int){
        let stringWithoutTags = textDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        
        let trimToCharacter = number
        let shortString = String(stringWithoutTags.prefix(trimToCharacter))
        descriptionLabel.text = shortString
        
    }
    
    func setDate(date dateUnformatted: String){
        //let dateString = "Thu, 22 Oct 2015 07:45:17 +0000"
        let dateString = dateUnformatted.replacingOccurrences(of: "UTC ", with: "")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd HH:mm:ss yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "MMMM dd"
        
        dateLabel.text = dateFormatter.string(from: dateObj!)
        //print("Dateobj: \(dateFormatter.string(from: dateObj!))")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
