//
//  ErrorHandler.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//


import Foundation
import UIKit

class ErrorHandler: NSObject {
    
    static func handleErrorMessage(message:String,onController:UIViewController){
        switch message {
        case ErrorHai.NO_INTERNET_CONNECTION, ErrorHai.INTERNET_ERROR:
            let alertController = UIAlertController(title: nil, message: "No Network Connection", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "OK", style: .cancel) { (action) in
            }
            alertController.addAction(action1)
            onController.present(alertController, animated: true, completion: nil)
            
        default:
            print("")
            
        }
    }
    
    
}
