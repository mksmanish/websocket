//
//  ViewController.swift
//  TESTobser
//
//  Created by Tradesocio on 22/04/22.
//

import UIKit
import Combine

class TestViewController: UIViewController {
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblTesting: UILabel!
    
    private var cancellables: Set<AnyCancellable> = []
    let viewModel = TestViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.testValue.bind { [weak self] anser in
            self?.lblValue.text = anser
        }
        
        viewModel.coun.bind { [weak self] ter in
            self?.lblCounter.text = ter
        }
        
        viewModel.lblfirst.bind { [weak self]  lblfir in
            self?.lblFirstName.text = lblfir
        }
        
        viewModel.$lblLast.sink { newValue in
            self.lblLastName.text = newValue
        }.store(in: &cancellables)
        
        viewModel.startTimer()
        viewModel.counter()
        viewModel.setuser()
        viewModel.lastName()
        
    }


}

