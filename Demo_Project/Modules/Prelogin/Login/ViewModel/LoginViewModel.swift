//
//  LoginViewModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 24/04/22.
//

import Foundation

enum UserValidationState {
    case Valid
    case Invalid(String)
}
final class LoginViewModel {
    private let minUsernameLength = 4
    private let minPasswordLength = 5
    private var user = User(username: "manish", password: "1234")
    var errormsg:ObservabObjec<String> = ObservabObjec("")
    
    func validate() -> Bool {
        if user.username.isEmpty || user.password.isEmpty {
            self.errormsg = ObservabObjec("Username and password are required.")
            return false
        }
        
        if user.username.count < minUsernameLength {
            self.errormsg = ObservabObjec("Username and password are required.")
            return false
        }
        
        if user.password.count < minPasswordLength {
            self.errormsg = ObservabObjec("Username and password are required.")
            return false
        }
        return true
    }
    
    func LoginIn(complication:@escaping(Bool) -> ()) {
        
        let url = URL(string: "https://nxcloud.tradesocio.com/user/api/v1/login/signin")
        let request = ["signin_data":["email": "1stdec21@mailinator.com","password": "Trade@123"]]
        do{
            let encodeData =  try JSONEncoder().encode(request)
            NetworkLayer.shared.postApiData(requestUrl: url!, requestBody: encodeData, parseClassName: SignIn.self) { result in
                print(result.message ?? "")
                complication(true)
            }
            
        }catch(let error){
            print("Error = \(error.localizedDescription)")
        }
      
    }

}

