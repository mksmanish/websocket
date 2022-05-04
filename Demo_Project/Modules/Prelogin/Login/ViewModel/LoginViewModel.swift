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
    
    func validate() -> UserValidationState {
        if user.username.isEmpty || user.password.isEmpty {
            return .Invalid("Username and password are required.")
        }
        
        if user.username.count < minUsernameLength {
            return .Invalid("Username needs to be at least \(minUsernameLength) characters long.")
        }
        
        if user.password.count < minPasswordLength {
            return .Invalid("Password needs to be at least \(minPasswordLength) characters long.")
        }
        
        return .Valid
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

