//
//  BaseViewController.swift
//  Demo_Project
//
//  Created by Tradesocio on 01/05/22.
//

import UIKit

class BaseViewController: UIViewController {
    var marketModel: MarketWatchModel?
    var marketArr = [QuotesStream]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goToEmployePage(){
        
        let str = UIStoryboard(name: "Employee", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func goToTest(){
        
        let str = UIStoryboard(name: "Test", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func goTomarket(){
        
        let str = UIStoryboard(name: "MarketWatch", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "MarketWatchViewController") as! MarketWatchViewController
        vc.marketValues = self.marketArr
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    


}
