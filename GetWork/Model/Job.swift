//
//  Job.swift
//  GetWork
//
//  Created by Max on 02/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

struct Job: Codable{
    var title: String
    var id: String
    var type: String
    var url: String
    var createdAt: String
    var company: String
    var description: String
    var companyLogo: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case id
        case type
        case url
        case createdAt = "created_at"
        case company
        case description
        case companyLogo = "company_logo"
    }
    
    
//     init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        title = try values.decode(String.self, forKey: .title)
//        id = try values.decode(String.self, forKey: .id)
//        type = try values.decode(String.self, forKey: .type)
//        url = try values.decode(String.self, forKey: .url)
//        createdAt = try values.decode(String.self, forKey: .createdAt)
//        company = try values.decode(String.self, forKey: .company)
//        description = try values.decode(String.self, forKey: .description)
//        companyLogo = try values.decode(String.self, forKey: .companyLogo)
//    }
    
//
//    init(_ dictionary: [String: Any]) {
//        self.title = dictionary["title"] as? String ?? ""
//        self.id = dictionary["id"] as? String ?? ""
//        self.type = dictionary["type"] as? String ?? ""
//        self.url = dictionary["url"] as? String ?? ""
//        self.createdAt = dictionary["created_at"] as? String ?? ""
//        self.company = dictionary["company"] as? String ?? ""
//        self.description = dictionary["description"] as? String ?? ""
//        self.companyLogo = dictionary["company_logo"] as? String ?? ""
//
//    }
}
