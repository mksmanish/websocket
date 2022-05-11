//
//  APIClient.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//


import Alamofire
import SwiftyJSON

class APIClient {
    
    @discardableResult
    /// Function to request data from URL and decode data into model
    ///
    /// - Parameters:
    ///   - route: APIRouter request
    ///   - decoder: json decoder
    ///   - completion: returns decodable model
    ///   - failure: if fail returns failure message or code
    /// - Returns: response for the request
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void,failure: @escaping (String)->Void) -> DataRequest  {
        let response = AF.request(route)
        if  Utility.shared.isInternetAvailable() {
            return response
                .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                    if response.response?.statusCode == 200 {
                        if let data = response.data {
                            do {
                                debugPrint("response::::",response.data!)
                                let customError = try decoder.decode(CustomError.self, from: data)
                                if let code = customError.code {
                                    if code != "00" {
                                        failure(customError.message ?? "")
                                    }else{
                                        completion(response.result)
                                    }
                                }else{
                                    completion(response.result)
                                }
                            }
                            catch _ {
                                completion(response.result)
                            }
                        }
                        
                    }else{
                        if let data = response.data {
                            do {
                                let customError = try decoder.decode(CustomError.self, from: data)
                                
                                if let code = customError.code {
                                    if code != "00"{
                                        failure(customError.message ?? "")
                                    }
                                }else{
                                    failure(customError.message ?? "")
                                }
                            }
                            catch _ {
                                failure(String(data: data, encoding: .utf8) ?? "")
                            }
                        }else{
                            failure("")
                        }
                    }
                }
        }else{
            print("The internet connection appears to be offline.")
        }
        return response
    }
    
    private static func performAuthRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response.result)
            }
    }
    
    static func login(account_tc_id:Int, completion:@escaping (AFResult<DepositeResponse>)->Void,failure: @escaping (String)->Void) {
        performRequest(route: APIRouter.login(account_tc_id:account_tc_id), completion: completion, failure: failure)
        
    }
    
    static func companydata(completion:@escaping (AFResult<CompanyData>)->Void,failure: @escaping (String)->Void){
        performRequest(route: APIRouter.companydata, completion: completion, failure: failure)
    }
    
    static func accountsdata(completion:@escaping (AFResult<AccountResponse>)->Void,failure: @escaping (String)->Void){
        performRequest(route: APIRouter.accountsdata, completion: completion, failure: failure)
    }
    
    static func employeedata(completion:@escaping (AFResult<[EmployeeModel]>)->Void,failure: @escaping (String)->Void){
        performRequest(route: APIRouter.employeedata, completion: completion, failure: failure)
    }
    
    static func getfavouriteData(completion:@escaping (AFResult<FavouitesModel>)->Void,failure: @escaping (String)->Void){
        performRequest(route: APIRouter.getFavoutitesData, completion: completion, failure: failure)
    }
    
    
}
