//
//  ViewController.swift
//  Demo_Project
//
//  Created by Tradesocio on 05/04/22.
//

import UIKit
import Alamofire
import SwiftWebSocket
/// This class is used for login with email and password.
class LoginViewController: BaseViewController{
    
    //MARK:- Outlet Declaration
    @IBOutlet weak var lblMainHeader: UILabel!
    @IBOutlet weak var lblDescHeader: UILabel!
    @IBOutlet weak var btnTryNow: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var viwEmail: UIView!
    @IBOutlet weak var viwPassword: UIView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var lblHavAcc: UILabel!
    @IBOutlet weak var btnCopyRight: UILabel!
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet weak var seg: UISegmentedControl!
    
    //MARK:- Vraible Declaration
    let theme = ThemeManager.currentTheme()
    var ws = WebSocket()
    var loginModel = LoginViewModel()
    var params = [String:Any]()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        socketsetup()
        setupController()
      //  requestusingAlamofire()
      //  postRequestusingURLsession()
        self.view.backgroundColor = theme.backgroundColor
    }
    
    func setupController() {
        // label styleSet
        lblMainHeader.font = FontManager.shared.getSpecificFont(size: ThemeConstant.FontSizeXXXL, fontName:"FontRobotoBold")
        lblMainHeader.setLabelStyle(textColor: FontManager.shared.convertHexColor(name: ThemeConstant.FontColorWhite), text: Constants.enjoyYourLife)
        
        lblDescHeader.font = FontManager.shared.getSpecificFont(size: ThemeConstant.FontSizeXXL, fontName:"FontRobotoBold")
        lblDescHeader.setLabelStyle(textColor: FontManager.shared.convertHexColor(name: ThemeConstant.FontColorWhite), text: Constants.letYourWealthText)
        lblWelcome.font = FontManager.shared.getSpecificFont(size: ThemeConstant.FontSizeXXXL, fontName:"FontRobotoBold")
        lblWelcome.setLabelStyle(textColor: ThemeConstant.blackColor, text: Constants.WelcomeToInvestNow)
        lblLogin.font = FontManager.shared.getSpecificFont(size: ThemeConstant.FontSizeS, fontName:"FontRobotoBold")
        lblLogin.setLabelStyle(textColor: ThemeConstant.grayColor, text: Constants.LoginToYourAccount)
        // button styleSet
        btnTryNow.setButtonStyle(alpha: 1.0, userInteraction:true, cornerRadius: 10.0, backgroundColor: ThemeConstant.whiteColor, font:UIFont.boldSystemFont(ofSize: 20.0), titleColor: ThemeConstant.btnColor, layerBorderColor: .clear, borderWidth: 0, text: Constants.TryNow)
        // Views
        btnLogin.setButtonStyle(alpha: 1.0, userInteraction: true, cornerRadius: 10.0, backgroundColor: theme.mainColor, font:UIFont.boldSystemFont(ofSize: 20.0), titleColor: ThemeConstant.whiteColor, layerBorderColor: .clear, borderWidth: 0, text: Constants.Login)
        
        loginView.setViewStyle(cornerRadius: 8.0, borderWidth: 1.0, borderColor: ThemeConstant.lighGrayColor.cgColor)
        viwEmail.setViewStyle(cornerRadius: 5.0, borderWidth: 1.0, borderColor: ThemeConstant.lighGrayColor.cgColor)
        viwPassword.setViewStyle(cornerRadius: 5.0, borderWidth: 1.0, borderColor: ThemeConstant.lighGrayColor.cgColor)
        
        // textFields
        txtEmail.placeholder = Constants.Email
        txtPassword.placeholder = Constants.Password
        
        btnCopyRight.font = FontManager.shared.getSpecificFont(size: ThemeConstant.FontSizeXS, fontName:"FontRobotoBold")
        btnCopyRight.setLabelStyle(textColor: FontManager.shared.convertHexColor(name: ThemeConstant.FontColorWhite), text: Constants.copyRight)
        
        // images
        Utility.shared.setSVG(imgView: imgLogo, name: DMSVG.shared.logo.getIcon())
       
    }
    
    func postRequestusingURLsession() {
        let url = URL(string: "https://nxcloud.tradesocio.com/account-settings/api/v1/psp/start-deposit-details-psp")
        let request = DepositeRequest(accountTcId:15905)
        do {
            let encodedRequest = try JSONEncoder().encode(request)
            NetworkLayer.shared.postApiData(requestUrl: url!, requestBody: encodedRequest, parseClassName: DepositeResponse.self) { (LoginUserResponse) in
                if (LoginUserResponse.message == "Success"){
                    print(LoginUserResponse.data?.accountCurrency ?? "")
                }}
            
        } catch let error {
            debugPrint("error = \(error.localizedDescription)")
        }
        
    }
    
    func requestusingAlamofire() {
        APIClient.accountsdata(completion: { (result) in
            switch result {
            case .success(let AccountResult):
                let  accDataResult = AccountResult
                print(accDataResult.data?.defaultAccount ?? "")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }) { (failure) in
            
            ErrorHandler.handleErrorMessage(message: failure, onController: self)
        }
    }
    
    @IBAction func btnSelectSegmentClick(_ sender: UISegmentedControl) {
        if seg.selectedSegmentIndex == 0 {// english
            self.languageLabel(strlen: "en")
        }else if seg.selectedSegmentIndex == 1 {//hindi
            self.languageLabel(strlen: "hi")
        }else if seg.selectedSegmentIndex == 2 {//chines
            self.languageLabel(strlen: "zh-Hans")
        }else{//spanish
            self.languageLabel(strlen: "es")
        }
        
    }
    
    func languageLabel(strlen:String) {
        lblMainHeader.text = "lblMainHeader".localizableString(loc: strlen)
        lblDescHeader.text = "lblDescHeader".localizableString(loc: strlen)
        btnTryNow.setTitle("btnTryNow".localizableString(loc: strlen), for: .normal)
        lblWelcome.text = "lblWelcome".localizableString(loc: strlen)
        lblLogin.text = "lblLogin".localizableString(loc: strlen)
        txtEmail.text = "email".localizableString(loc: strlen)
        txtPassword.text = "Password".localizableString(loc: strlen)
        btnLogin.setTitle("Login".localizableString(loc: strlen), for: .normal)
        lblHavAcc.text = "NoAcc".localizableString(loc: strlen)
        btnCopyRight.text = "copyRight".localizableString(loc: strlen)
        btnForgotPassword.setTitle("ForgotPassword".localizableString(loc: strlen), for:.normal)
       
    }
    
    @IBAction func btnloginValid(_ sender: UIButton) {
       
        params["userEmail"] = txtEmail.text
        params["password"] = txtPassword.text
        let (status,error) =  loginModel.txtHandler(model: userModel.init(params:params))
        if status{
            ActivityLoader.shared.showloader(view: view)
            self.loginModel.LoginIn { result in
                if result == true{
                    ActivityLoader.shared.hideloader()
                    self.goTomarket()
                }
            }
        }else{
            showToast(message:error, font: .systemFont(ofSize: 15.0))
        }
    }
    
    @IBAction func btnTryNow(_ sender: UIButton) {
        self.goToEmployePage()
    }
    
    func socketsetup(){
        Socketservice.shared().SocketDataAPI() { (result,status)  in
            DispatchQueue.main.async {
                if status == "Closed"{
                  print("closed")
                }else if status == "Open"{
                  print("opened")
                }
                self.marketModel = result
                if let market = self.marketModel?.quotesStream?[0] {
                    self.marketArr.append(market)
                }else{
                    print("no data")
                }
                if result?.quotesStream != nil{
                    self.marketModel?.quotesStream = result?.quotesStream
                }
               if result?.reason == "VALID"{
                     self.socketSecondRequest()
                }
            }
        }
        
    }
    
    func socketSecondRequest(){
        let json: [String:Any] = ["msgtype": 140, "Account": 1]
        NSLog("##### GC1 second request -------> \(json)")
        let req = "{\n  \"ConnID\" : 118,\n  \"msgtype\" : 17,\n  \"Symbol\" : [\n    {\n      \"Name\" : \"JRS\"\n    },\n    {\n      \"Name\" : \"AMAZON\"\n    },\n    {\n      \"Name\" : \"VYM\"\n    },\n    {\n      \"Name\" : \"AUDCAD\"\n    },\n    {\n      \"Name\" : \"LNG\"\n    },\n    {\n      \"Name\" : \"INDA\"\n    },\n    {\n      \"Name\" : \"STPZ\"\n    },\n    {\n      \"Name\" : \"JRO\"\n    },\n    {\n      \"Name\" : \"DIA\"\n    }\n  ],\n  \"NoOfSymbols\" : 9\n}"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted);
            if let string = String(data: jsonData, encoding: String.Encoding.utf8){
               // let one = "{\n  \"RTAccountInfo\" : 1,\n  \"Version\" : 1.5,\n  \"Password\" : \"abc123\",\n  \"msgtype\" : 41,\n  \"UserName\" : \"13164\"\n}
                Socketservice.shared().ws.send(req)
                //saveSocketLog()

            } else {
                //print("Couldn't create json string");
            }
        } catch let error {
            print("Couldn't create json data: \(error)");
        }
    }
   
  
}

