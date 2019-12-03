//
//  Networking.swift
//  GetWork
//
//  Created by Max on 03/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//
import Foundation


enum HolidayError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct NetworkRequest {
    
    var resourceURL: URL
   // var text: String
    //var page: Int
    
    init(text: String, page: Int) {
        //self.text = text
       // self.page = page
        
        let destinationURL = "https://jobs.github.com/positions.json?search=\(text)&page=\(page)"
        
        guard let resourceURL = URL(string: destinationURL) else {fatalError()}
        
        self.resourceURL = resourceURL
        
    }
    
    
    func getJobs (compleation: @escaping(Result<[Job], HolidayError>) ->Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            
            guard let jsonData = data else {
                compleation(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let jobs = try decoder.decode([Job].self, from: jsonData)
                compleation(.success(jobs))
            }catch{
                compleation(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }
}
