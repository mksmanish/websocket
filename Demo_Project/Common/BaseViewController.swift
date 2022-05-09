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
    
    func goToPageController() {
      
            let str = UIStoryboard(name: "PageView", bundle: nil)
            let vc = str.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
      
    }
    
    func goToEmployePage(){
        
        DispatchQueue.main.async {
            let str = UIStoryboard(name: "Employee", bundle: nil)
            let vc = str.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
    }
    
    func goToTest(){
        
        let str = UIStoryboard(name: "Test", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func goTomarket(){
        
        DispatchQueue.main.sync {
            let str = UIStoryboard(name: "MarketWatch", bundle: nil)
            let vc = str.instantiateViewController(withIdentifier: "MarketWatchViewController") as! MarketWatchViewController
            vc.marketValues = self.marketArr
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
}
