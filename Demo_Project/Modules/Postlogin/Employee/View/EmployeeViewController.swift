//
//  EmployeeViewController.swift
//  Demo_Project
//
//  Created by Tradesocio on 25/04/22.
//

import UIKit

class EmployeeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tblViewEmp: UITableView!
    let viewModel = EmployeeViewModel()
    var refresh : UIRefreshControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblViewEmp.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: "EmployeeCell")
        self.tblViewEmp.dataSource = self
        self.tblViewEmp.delegate = self
        
        viewModel.fetchEmployees { success in
            if success == true{
                print("api hit")
            }
        }
        sleep(5)
        setupbinders()
       
    }
    
    func setupbinders() {
        self.refresh?.beginRefreshing()
        viewModel.employees.bind { [weak self] (_) in
            DispatchQueue.main.async {
                self?.tblViewEmp.reloadData()
            }
            self?.refresh?.endRefreshing()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employees.value.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewEmp.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell
        cell.employeeValue = viewModel.employees.value[indexPath.row]
        return cell
        
    }
    
}


class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var employeeValue:EmployeeModel! {
        didSet{
            lblName.text = employeeValue.name
            lblEmail.text = employeeValue.email
            lblGender.text = employeeValue.gender
            lblStatus.text = employeeValue.status
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


