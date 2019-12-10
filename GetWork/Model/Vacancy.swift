//
//  Vacancy.swift
//  GetWork
//
//  Created by Max on 10/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

// MARK: - Vacancy
struct Vacancy: Codable {
    let id: String
    let premium: Bool
    let billingType: BillingType
    //let relations: [JSONAny]
    let name: String
   // let insiderInterview: JSONNull?
    let responseLetterRequired: Bool
    let area: Area
    let salary: Salary?
    let type: BillingType
    let address: Address?
    let allowMessages: Bool
    let site, experience, schedule, employment: BillingType
    //let department: JSONNull?
    let contacts: Contacts?
    let vacancyDescription: String?
    let brandedDescription: String?
    //let vacancyConstructorTemplate: JSONNull?
    let keySkills: [KeySkill]
    let acceptHandicapped, acceptKids, archived: Bool
  //  let responseURL: JSONNull?
    let specializations: [Specialization]
   // let code: JSONNull?
    let hidden, quickResponsesAllowed: Bool
    //let driverLicenseTypes: [JSONAny]
    let acceptIncompleteResumes: Bool
    let employer: Employer
    let publishedAt, createdAt: String
    //let negotiationsURL, suitableResumesURL: JSONNull?
    let applyAlternateURL: String
    let hasTest: Bool
    //let test: JSONNull?
    let alternateURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, premium
        case billingType = "billing_type"
        case name
       // case insiderInterview = "insider_interview"
        case responseLetterRequired = "response_letter_required"
        case area, salary, type, address
        case allowMessages = "allow_messages"
        case site, experience, schedule, employment, contacts
        case vacancyDescription = "description"
        case brandedDescription = "branded_description"
        //case vacancyConstructorTemplate = "vacancy_constructor_template"
        case keySkills = "key_skills"
        case acceptHandicapped = "accept_handicapped"
        case acceptKids = "accept_kids"
        case archived
       // case responseURL = "response_url"
        case specializations, hidden
        case quickResponsesAllowed = "quick_responses_allowed"
        //case driverLicenseTypes = "driver_license_types"
        case acceptIncompleteResumes = "accept_incomplete_resumes"
        case employer
        case publishedAt = "published_at"
        case createdAt = "created_at"
        //case negotiationsURL = "negotiations_url"
        //case suitableResumesURL = "suitable_resumes_url"
        case applyAlternateURL = "apply_alternate_url"
        case hasTest = "has_test"
        //case test
        case alternateURL = "alternate_url"
    }
    init?() {
        return nil
    }
}


// MARK: - KeySkill
struct KeySkill: Codable {
    let name: String
}

// MARK: - BillingType
struct BillingType: Codable {
    let id, name: String
}

// MARK: - Specialization
struct Specialization: Codable {
    let id, name, profareaID, profareaName: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case profareaID = "profarea_id"
        case profareaName = "profarea_name"
    }
}
