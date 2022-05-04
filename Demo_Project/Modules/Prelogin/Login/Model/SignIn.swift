//
//  SignIn.swift
//  Demo_Project
//
//  Created by Tradesocio on 04/05/22.
//

import Foundation

class SignIn: Decodable {
    let message: String?
    var token: String?
    let is_email_verified: Bool?
    let success: Bool?
    let active_role: Int?
    let is_mobile_pin_available: Bool?
    let token_expiry_time: Int?
    let is_pending_admin_approval: Bool?
    let allow_login: Bool?
    let joining_token:String?
    let new_joining_token:String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case token = "token"
        case is_email_verified = "is_email_verified"
        case success = "success"
        case active_role = "active_role"
        case is_mobile_pin_available = "is_mobile_pin_available"
        case token_expiry_time = "token_expiry_time"
        case is_pending_admin_approval = "is_pending_admin_approval"
        case allow_login = "allow_login"
        case joining_token = "joining_token"
        case new_joining_token = "new_joining_token"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let val = try? container.decode(String.self, forKey: .message){
            message = val
        }else{
            message = nil
        }
        if let val = try? container.decode(Bool.self, forKey: .success){
            success = val
        }else{
            success = nil
        }
        if let val = try? container.decode(String.self, forKey: .token){
            token = val
        }else{
            token = nil
        }
        if let val = try? container.decode(Bool.self, forKey: .is_email_verified){
            is_email_verified = val
        }else{
            is_email_verified = nil
        }
        if let val = try? container.decode(Int.self, forKey: .active_role){
            active_role = val
        }else{
            active_role = nil
        }
        if let val = try? container.decode(Bool.self, forKey: .is_mobile_pin_available){
            is_mobile_pin_available = val
        }else{
            is_mobile_pin_available = nil
        }
        if let val = try? container.decode(Int.self, forKey: .token_expiry_time){
            token_expiry_time = val
        }else{
            token_expiry_time = nil
        }
        if let val = try? container.decode(Bool.self, forKey: .is_pending_admin_approval){
            is_pending_admin_approval = val
        }else{
            is_pending_admin_approval = nil
        }
        if let val = try? container.decode(Bool.self, forKey: .allow_login){
            allow_login = val
        }else{
            allow_login = nil
        }
        if let val = try? container.decode(String.self, forKey: .joining_token){
            joining_token = val
        }else{
            joining_token = nil
        }
        if let val = try? container.decode(String.self, forKey: .new_joining_token){
            new_joining_token = val
        }else{
            new_joining_token = nil
        }
        
    }
}
