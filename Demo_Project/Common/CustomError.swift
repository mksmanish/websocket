//
//  CustomError.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
struct CustomError: Codable {
    var code: String?
    var message: String?
    var result: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case result
    }
}
