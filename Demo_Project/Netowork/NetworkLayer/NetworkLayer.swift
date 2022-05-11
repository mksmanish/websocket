//
//  NetworkLayer.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
import Alamofire

class NetworkLayer {
    static let shared = NetworkLayer()
    // for the  Get request
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue(Constants.kToken, forHTTPHeaderField: "Authorization")
        if Utility.shared.isInternetAvailable() {
            URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
                if(error == nil && responseData != nil && responseData?.count != 0)
                {
                    //parse the responseData here
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: responseData!)
                        _=completionHandler(result)
                    }
                    catch let error{
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
                
            }.resume()
        }else{
            print("The internet connection appears to be offline.")
        }
    }
    
    // for the post request
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, parseClassName: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue(UserDefaults.standard.string(forKey: "kToken") ?? "", forHTTPHeaderField: "Authorization")
        
        if Utility.shared.isInternetAvailable(){
            print("url hitting->\(urlRequest)")
            do {
                let result = try JSONSerialization.jsonObject(with: requestBody, options: .mutableContainers)
                print("param passed->\(result)")
                
            } catch let myJSONError {
                print(myJSONError.localizedDescription)
            }
            
            URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
                
                if(data != nil && data?.count != 0)
                {
                    do {
                        let result = try JSONDecoder().decode(T.self ,from:data!)
                        completionHandler(result)
                        
                        
                    } catch let myJSONError {
                        print(myJSONError.localizedDescription)
                        
                    }
                }
            }.resume()
        }else{
            print("The internet connection appears to be offline.")
        }
    }
    

}
