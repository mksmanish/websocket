//
//  PageViewController.swift
//  Demo_Project
//
//  Created by Tradesocio on 09/05/22.
//

import UIKit
import iCarousel

struct items {
    let image: String?
    let header : String?
    let descript : String?
    
}
/// This class is displayed after the click of TryNow Button and pagecontrol
class PageViewController: BaseViewController,iCarouselDelegate ,iCarouselDataSource{
    
    // MARK: - @IBOutlets
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnNextCircular: UIButton!
    
    //MARK: - Variables declaratins
    var imageArr: [items] = []
    var index:Int = 0
    let theme = ThemeManager.currentTheme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.delegate = self
        carouselView.dataSource = self
        imageArr.append(items( image: DMSVG.shared.pip.getIcon(), header: Constants.Personalized_investment_portfolio, descript: Constants.Personalised_text))
        imageArr.append(items( image: DMSVG.shared.seamless.getIcon(), header:Constants.Seamless_payment_to_fund_your_investments , descript:Constants.Seamless_text))
        imageArr.append(items( image: DMSVG.shared.smartReco.getIcon(), header:Constants.Smart_recommendations_to_get_it_right , descript:Constants.Smart_text))
        imageArr.append(items( image: DMSVG.shared.track.getIcon(), header:Constants.Track_movements_anytime_anywhere , descript:Constants.Track_text ))
        btnNext.setButtonStyle(alpha: 1.0, userInteraction: true, cornerRadius: 10.0, backgroundColor: theme.mainColor, font:UIFont.boldSystemFont(ofSize: 25.0), titleColor: ThemeConstant.whiteColor, layerBorderColor: .clear, borderWidth: 0, text: Constants.Next)
        btnNext.isHidden = true
        btnNextCircular.isHidden = false
        pageCtrl.numberOfPages = imageArr.count
        pageCtrl.hidesForSinglePage = true
        
        carouselView.isPagingEnabled = true
        self.carouselView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: -  Carousel delegate and data Source
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imageArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let viw = Bundle.main.loadNibNamed("page", owner: self, options: nil)![0] as! page
        viw.frame.size = CGSize(width: carouselView.frame.size.width , height: carouselView.frame.size.height)
        viw.layer.cornerRadius = 10.0
        Utility.shared.setSVG(imgView: viw.image, name: imageArr[index].image ?? "")
        viw.headerTitle.text = imageArr[index].header
        viw.desc.text = imageArr[index].descript
        return viw
    }
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.0
        }
        return value
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel)
    {
        index = carousel.currentItemIndex
        self.pageCtrl.currentPage = index
        Utility.shared.updatePageControl(pager: self.pageCtrl)
        if carousel.currentItemIndex == 3{
            DispatchQueue.main.async {
                self.btnNext.isHidden = false
                self.btnNextCircular.isHidden = true
            }
        }
        
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        self.goToEmployePage()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        index = index + 1
        self.pageCtrl.currentPage = index
        Utility.shared.updatePageControl(pager: self.pageCtrl)

    }
    @IBAction func btnNextAction(_ sender: UIButton) {
        
    }
    
}
