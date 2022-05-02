//
//  Validation.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import UIKit

/// This is class will have commom methods which will be accessible throughout application.
class Validation : NSObject {
    
    static let shared = Validation()
    
    /*
     Method : isBlank
     // function is for checking if the textfield is blank
     Inputs : textfield's text
     */
    class func isBlank(txtField : UITextField) -> Bool
    {
        if (txtField.text?.lengthOfBytes(using: .utf8))! > 0
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    /*
     Method : isMatching
     // to check if the two textfields have same string
     Inputs : to strings
     */
    class func isMatching(firstTxtField : UITextField , secondTxtField : UITextField) -> Bool
    {
        
        if (firstTxtField.text == secondTxtField.text) {
            return true
        }
        else
        {
            return false
        }
    }
    
    /*
     Method : isMatching
     // to validate the phone Number
     Inputs : to strings
     */
    static func isPhoneNumbervalidate(value: String) -> Bool {
        let PHONESTRINGREGEX = "^+[1-9]{1}[0-9]{3,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONESTRINGREGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    /*
     Method :  isValidEmail
     // to validate the email
     Inputs : to strings
     */
    static func isValidEmail(_ email:String) -> Bool {
        
        let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
        let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)
        return __emailPredicate.evaluate(with: email)
        
    }
    
    /*
     Method : isPasswordValid
     // to validate the password
     Inputs : to strings
     */
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[0-9])(?=.*[A-Z])[A-Za-z\\d$@$#!%*?&]{6,26}")
        return passwordTest.evaluate(with: password)
    }
    
    /*
     Method : roundToClosestMultipleNumber
     // to round off the value to nearest multiple value.
     Inputs : to strings
     */
    static func roundToClosestMultipleNumber(_ numberOne: Int, _ numberTwo: Int) -> Int {
        
        var result: Int = numberOne
        
        if numberOne % numberTwo != 0 {
            
            if numberOne < numberTwo {
                result = numberTwo
            } else {
                result = (numberOne / numberTwo + 1) * numberTwo
            }
        }
        
        return result
    }
}
