//
//  Router.swift
//  GetWork
//
//  Created by Max on 03/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, complition: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do{
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                complition(data, response, error)
            })
        }catch{
            complition(nil, nil, error)
        }
        self.task?.resume()
        
    }
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        do{
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                let urlParameters):
                
                try self.configureParameters(bodyParameters: bodyParameters,
                    urlParameters: urlParameters,
                    request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                            let urlParameters,
                                            let additionHeaders):
                self.addAdditionalHeaders(additionHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            }
            return request
        } catch{
            throw error
        }
        
    }
    
    private func configureParameters(bodyParameters: Parameters?,
                                     urlParameters: Parameters?,
                                     request: inout URLRequest) throws {
        do{
            if let bodyParameters = bodyParameters{
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters{
                try JSONParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch{
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else {return}
        for (key, value) in headers{
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    func cancel() {
        self.task?.cancel()
    }
}
