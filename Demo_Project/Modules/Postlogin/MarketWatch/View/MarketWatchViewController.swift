//
//  MarketWatchViewController.swift
//  Demo_Project
//
//  Created by Tradesocio on 28/04/22.
//

import UIKit
import CarbonKit

/// This class is used for watchWatch and its functionalities
class MarketWatchViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,cellclicked{
   
    //MARK:- IBOutlet Declaration
    @IBOutlet weak var tblViw: UITableView!
    
    
    //MARK:- Vraible Declaration
    var marketValues = [QuotesStream]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblViw.register(UINib(nibName: CellIdentifiers.marketWatchCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.marketWatchCell)
        self.tblViw.dataSource = self
        self.tblViw.delegate = self
        let items = ["Features", "Products", "About"]
      
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- tableView datasources and delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViw.dequeueReusableCell(withIdentifier: CellIdentifiers.marketWatchCell, for: indexPath) as! marketWatchCell
        cell.symbol.text = marketValues[indexPath.row].symbol
        cell.bid.text = String(marketValues[indexPath.row].feedInDepth?[0].bidPrice ?? 0.0)
        cell.spread.text = String(marketValues[indexPath.row].feedInDepth?[0].askQuantity ?? 0)
        cell.ask.text = String(marketValues[indexPath.row].feedInDepth?[0].askPrice ?? 0.0)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
        {
            let BuyAction = UIContextualAction(style: .normal, title:  Constants.Buy, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Update action ...")
                success(true)
            })
            BuyAction.backgroundColor = .systemGreen

            let SellAction = UIContextualAction(style: .normal, title:  Constants.Sell, handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Update action ...")
                success(true)
            })
            SellAction.backgroundColor = .red

            return UISwipeActionsConfiguration(actions: [SellAction,BuyAction])
        }
    
        func buttontapped(number: Int) {
            let alert = UIAlertController(title: Constants.SymbolSubscription, message: Constants.SymbolSubscriptionMsg,preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: Constants.Cancel, style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: Constants.Confirm,
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
            }))
            self.present(alert, animated: true, completion: nil)
       }
    

    @IBAction func button_logout(_ sender: Any) {
        let alert = UIAlertController(title: Constants.logout, message: Constants.logoutMsg,preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.Cancel, style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: Constants.Confirm,
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}




protocol cellclicked{
    func buttontapped(number:Int)
}

class marketWatchCell:UITableViewCell{
 
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var bid: UILabel!
    @IBOutlet weak var spread: UILabel!
    @IBOutlet weak var ask: UILabel!
    @IBOutlet weak var imgHeartFilled: UIImageView!
    
    var delegate:cellclicked?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func btnAddFavourites(_ sender: UIButton) {
        delegate?.buttontapped(number: sender.tag)
        
    }
    
   
    
}
