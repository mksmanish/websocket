//
//  LoginViewModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 24/04/22.
//

import Foundation


final class LoginViewModel {
    var errormsg:ObservabObjec<String> = ObservabObjec("")
    
    func txtHandler(model:userModel) -> (Bool,String) {
        var status = true
        var error = ""
        if model.userEmail?.isEmpty ?? false || model.password?.isEmpty ?? false{
            status = false
            error = "please enter credentails"
        }
        if model.userEmail != "1stdec21@mailinator.com" || model.password
            != "Trade@123"{
            status = false
            error = "please enter  valid credentails"
        }
        return (status,error)
    }
    
    
    func LoginIn(complication:@escaping(Bool) -> ()) {
        
        let url = URL(string: "https://nxcloud.tradesocio.com/user/api/v1/login/signin")
        let request = ["signin_data":["email": "1stdec21@mailinator.com","password": "Trade@123"]]
        do{
            let encodeData =  try JSONEncoder().encode(request)
            NetworkLayer.shared.postApiData(requestUrl: url!, requestBody: encodeData, parseClassName: SignIn.self) { result in
                print(result.message ?? "")
                UserDefaults.standard.set(result.token, forKey: "kToken")
                complication(true)
            }
            
        }catch(let error){
            print("Error = \(error.localizedDescription)")
        }
      
    }

}

