//
//  Helper.swift
//  GetWork
//
//  Created by Max on 12/12/2019.
//  Copyright © 2019 chulkov. All rights reserved.
//

import Foundation

class Helper {
    class func testFunction() {
        // Do something
    }
    class func prepareSalaryLabel(from: Int?, to: Int?, currency: String?, gross: Bool) -> String{
        
        var resultString = ""
        
        
        if let fromSalary = from, let toSalary = to{
            resultString = "\(fromSalary) - \(toSalary) \(currency!)"
            return resultString
        }else{
            if let fromSalary = from{
                resultString = "от \(fromSalary)"
                return resultString
            }else{
                return ""
            }
        }
        
    }
}
