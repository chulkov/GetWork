//
//  NetworkRouter.swift
//  GetWork
//
//  Created by Max on 03/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter : class{
    associatedtype EndPoint : EndPointType
    func request(_ route: EndPoint, complition: @escaping NetworkRouterCompletion)
    func cancel()
}
