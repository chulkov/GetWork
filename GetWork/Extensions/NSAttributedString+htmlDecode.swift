//
//  NSAttributedString+htmlDecode.swift
//  GetWork
//
//  Created by Max on 11/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    convenience init(htmlString html: String) throws {
        try self.init(data: Data(html.utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
    }
    
}
