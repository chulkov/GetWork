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
    
    
    //let baseURL = "https://jobs.github.com/positions.json"
    
    let baseURL = "https://api.hh.ru/"

   // var text: String
    //var page: Int
    
    init() {
        
    }

    
    func getJobsWithSearch (text:String, page: Int, compleation: @escaping(Result<Job, HolidayError>) ->Void) {
        
        let destinationURL = baseURL + "vacancies?text=\(text)&page=\(page)"
        let urlString = destinationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let resourceURL = URL(string: urlString!) else {fatalError()}
        //self.resourceURL = resourceURL
        print("\(resourceURL)")
        
        
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            
            guard let jsonData = data else {
                compleation(.failure(.noDataAvailable))
                return
            }

            do{
                let decoder = JSONDecoder()
                let jobs = try decoder.decode(Job.self, from: jsonData)
                compleation(.success(jobs))
            }catch{
                print(error.localizedDescription)
                compleation(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }
    func getJobs( compleation: @escaping(Result<Job, HolidayError>) ->Void) {
        
        let destinationURL = baseURL + "vacancies"
        let urlString = destinationURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let resourceURL = URL(string: urlString!) else {fatalError()}
        //self.resourceURL = resourceURL
        print("\(resourceURL)")
        
        
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            //print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
            guard let jsonData = data else {
                compleation(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let jobs = try decoder.decode(Job.self, from: jsonData)
                compleation(.success(jobs))
            }catch{
                print(error.localizedDescription)
            }
            
        }
        dataTask.resume()
    }

}
