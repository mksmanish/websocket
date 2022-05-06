//
//  UserModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 05/05/22.
//

import Foundation
/// model class for the login Controller
class userModel {
    // MARK: - userModel
    var userEmail:String?
    var password: String?
    
    init(params:[String:Any]) {
        self.userEmail = params["userEmail"] as? String
        self.password =  params["password"] as? String
    }
}
extension userModel {
    
    //MARK: - user Defined Funcctions
    func isValidCount() -> Bool {
        return userEmail!.count > 10
    }
    
    func isValidUserEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: userEmail)
    }
    func isPasswordCount() -> Bool {
        return password!.count > 5
    }
    
    func isPasswordSecure() -> Bool {
        guard let pass = password else {
            return false
        }
        for char in pass {
            if char == "•"{
                continue
            }
            return false
        }
        return true
    }
    func isvalidCreds() -> Bool {
        if userEmail == "1stdec21@mailinator.com" && password == "Trade@123"{
            return true
        }else{
            return false
        }
    }
}
