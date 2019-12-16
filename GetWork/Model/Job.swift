//
//  Job.swift
//  GetWork
//
//  Created by Max on 02/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation


struct Job: Codable {
    let items: [Item]
    let found, pages, perPage, page: Int
    //let clusters, arguments: JSONNull?
    let alternateURL: String
    
    enum CodingKeys: String, CodingKey {
        case items, found, pages
        case perPage = "per_page"
        case page//, clusters, arguments
        case alternateURL = "alternate_url"
    }
    
    init?() {
        return nil
    }
}


// MARK: - Item
struct Item: Codable {
    let id: String
    let premium: Bool
    let name: String
    let department: TypeClass?
    let hasTest: Bool
    let responseLetterRequired: Bool
    let area: Area
    let salary: Salary?
    let type: TypeClass
    let address: Address?
//    let responseURL, sortPointDistance: JSONNull?
    let employer: Employer?
    let publishedAt: String
    let createdAt: String
    let archived: Bool
    let applyAlternateURL: String
//    let insiderInterview: JSONNull?
    let url: String
    let alternateURL: String
//    let relations: [JSONAny]
    let snippet: Snippet
    let contacts: Contacts?
    
    enum CodingKeys: String, CodingKey {
        case id, premium, name, department
        case hasTest = "has_test"
        case responseLetterRequired = "response_letter_required"
        case area, salary, type, address
        //case responseURL = "response_url"
       // case sortPointDistance = "sort_point_distance"
        case employer
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case archived
        case applyAlternateURL = "apply_alternate_url"
        //case insiderInterview = "insider_interview"
        case url
        case alternateURL = "alternate_url"
        case snippet, contacts
    }
}

// MARK: - Address
struct Address: Codable {
    let city, street, building: String?
//    let addressDescription: JSONNull?
    let lat: Double?
    let lng: Double?
    let raw: String?
    let metro: Metro?
    let metroStations: [Metro]
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case city, street, building
        //case addressDescription = "description"
        case lat, lng, raw, metro
        case metroStations = "metro_stations"
        case id
    }
}

// MARK: - Metro
struct Metro: Codable {
    let stationName, lineName, stationID, lineID: String
    let lat, lng: Double
    
    enum CodingKeys: String, CodingKey {
        case stationName = "station_name"
        case lineName = "line_name"
        case stationID = "station_id"
        case lineID = "line_id"
        case lat, lng
    }
}

// MARK: - Area
struct Area: Codable {
    let id, name: String
    let url: String
}

// MARK: - Contacts
struct Contacts: Codable {
    let name, email: String?
    let phones: [Phone]
}

// MARK: - Phone
struct Phone: Codable {
    let comment: String?
    let city, number, country: String
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let id: String
    let name: String
}

// MARK: - Employer
struct Employer: Codable {
    let id, name: String?
    let url, alternateURL: String?
    let logoUrls: LogoUrls?
    let vacanciesURL: String?
    let trusted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, url
        case alternateURL = "alternate_url"
        case logoUrls = "logo_urls"
        case vacanciesURL = "vacancies_url"
        case trusted
    }
}

// MARK: - LogoUrls
struct LogoUrls: Codable {
    let the90, the240: String
    let original: String
    
    enum CodingKeys: String, CodingKey {
        case the90 = "90"
        case the240 = "240"
        case original
    }
}

// MARK: - Salary
struct Salary: Codable {
    let from: Int?
    let to: Int?
    let currency: String?
    let gross: Bool?
}

//enum Currency: String, Codable {
//    case rur = "RUR"
//}

// MARK: - Snippet
struct Snippet: Codable {
    let requirement, responsibility: String?
}
