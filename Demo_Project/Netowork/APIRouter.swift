//
//  APIRouter.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIRouter: URLRequestConvertible {
    
    case login(account_tc_id:Int)
    case companydata
    case accountsdata
    case employeedata
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .companydata,.accountsdata,.employeedata:
            return .get
            
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/account-settings/api/v1/psp/start-deposit-details-psp"
        case .companydata:
            return "/api/User/GetUser"
        case .accountsdata:
            return "/user/api/v1/users/accounts"
        case .employeedata:
            return "/v2/users"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(_):
            return nil
        case .companydata:
            return nil
        case .accountsdata:
            return nil
        case .employeedata:
            return nil
            
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var url = try BaseUrl.local.rawValue.asURL()
        #if local
        url = try BaseUrl.local.rawValue.asURL()
        #elseif QA
        url = try BaseUrl.QA.rawValue.asURL()
        #elseif Prod
        url = try BaseUrl.Prod.rawValue.asURL()
        #elseif UAT
        url = try BaseUrl.UAT.rawValue.asURL()
        #elseif CUG
        url = try BaseUrl.CUG.rawValue.asURL()
        #endif
        
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Parameters
        if let parameters = parameters {
            do {
                if JSONSerialization.isValidJSONObject(parameters) {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                }else {
                    _ = try JSONSerialization.data(withJSONObject: JSON(parameters).dictionary ?? "", options: [])
                    urlRequest.httpBody = try JSON(parameters).rawData()
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        switch self {
        case .login(_):
            urlRequest.setValue(Constants.kToken, forHTTPHeaderField:  HTTPHeaderField.Authorization.rawValue)
        case .companydata:
            print("Response")
        case .accountsdata:
            urlRequest.setValue(Constants.kToken, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        case .employeedata:
            urlRequest.setValue(Constants.kToken, forHTTPHeaderField: HTTPHeaderField.Authorization.rawValue)
        default:
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        
        return urlRequest
    }
}


