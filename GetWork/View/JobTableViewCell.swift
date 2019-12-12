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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var salaryLabel: UILabel!
    
    @IBOutlet weak var cityLeadingConstraint: NSLayoutConstraint!
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
       // 2019-11-25T09:59:39+0300
        let dateString = dateUnformatted.replacingOccurrences(of: "T", with: " ")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd HH:mm:ss+zzzz"
        //dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss +zzzz"
        
        dateFormatter.locale = Locale.init(identifier: "ru_RU")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "dd MMMM"
        if let date = dateObj{
            dateLabel.text = dateFormatter.string(from: date)
        }
        
        //print("Dateobj: \(dateFormatter.string(from: dateObj!))")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
