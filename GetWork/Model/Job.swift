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
    
//    init() {
//        self.items = Item()
//    }
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
    let employer: Employer
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
    let raw: String
    let metro: Metro?
    let metroStations: [Metro]
    let id: String
    
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
    let name, email: String
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

//enum ID: String, Codable {
//    case bil4934Beel = "bil-4934-beel"
//    case idOpen = "open"
//}
//
//enum Name: String, Codable {
//    case билайн = "Билайн"
//    case открытая = "Открытая"
//}

// MARK: - Employer
struct Employer: Codable {
    let id, name: String
    let url, alternateURL: String
    let logoUrls: LogoUrls?
    let vacanciesURL: String
    let trusted: Bool
    
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
    let currency: Currency
    let gross: Bool
}

enum Currency: String, Codable {
    case rur = "RUR"
}

// MARK: - Snippet
struct Snippet: Codable {
    let requirement, responsibility: String?
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}

//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
