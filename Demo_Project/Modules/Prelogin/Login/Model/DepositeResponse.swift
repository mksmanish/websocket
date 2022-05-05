//
//  LoginUser.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import SkyFloatingLabelTextField
// MARK: - loginUserr


struct DepositeResponse: Decodable{
    let success: Bool?
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass
struct DataClass:Decodable {
   
    let accountBalance, convertedBalance, introducerID: Int?
    let isChargePercent: Bool?
    let min, max, convertedMin, convertedMax: Int?
    let chargeApplied, accountID: Int?
    let accountCurrency: String?
 
}

struct DepositeRequest: Encodable{
    let accountTcId : Int
    
    enum CodingKeys: String, CodingKey {
        case accountTcId = "account_tc_id"
        
    }
    
}


class userModel {
    var userEmail:String?
    var password: String?
    
    init(params:[String:Any]) {
        self.userEmail = params["userEmail"] as? String
        self.password =  params["password"] as? String
    }
}

extension userModel {
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
