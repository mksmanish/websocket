//
//  EmployeeViewModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 25/04/22.
//

import Foundation

protocol ObservableViewModelProtocol {
    func fetchEmployees(complition:@escaping(Bool,String)->  ())
    func setError(_ message: String)
    var employees: ObservabObjec<[EmployeeModel]> { get  set }
    var errorMessage: ObservabObjec<String?> { get set }
}

class EmployeeViewModel: ObservableViewModelProtocol {

    
    var employees = ObservabObjec<[EmployeeModel]>([])
    var errorMessage: ObservabObjec<String?> = ObservabObjec(nil)
    func fetchEmployees(complition:@escaping(Bool,String) ->  ()) {
        let url = URL(string: "https://gorest.co.in/public/v2/users")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil {
                do{
                    let result = try JSONDecoder().decode([EmployeeModel].self, from: data!)
                    print("result.count\(result.count)")
                    self.employees = ObservabObjec(result)
                    complition(true,"")
                }catch(let error) {
                    self.employees = ObservabObjec([])
                    self.errorMessage = ObservabObjec(error.localizedDescription)
                    complition(false,error.localizedDescription)
                }
            }
        }.resume()
    }
    func setError(_ message: String) {
        self.errorMessage = ObservabObjec(message)
        
    }
    
}
