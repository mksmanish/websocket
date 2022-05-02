//
//  EmployeeModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 25/04/22.
//

import Foundation
// MARK: - EmployeeResponse
struct EmployeeModel : Codable{
    let name, email, gender,status: String?
    let id:Int?
   
    
    enum codingKeys: String,CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case gender = "gender"
        case status = "status"
        
    }
}
