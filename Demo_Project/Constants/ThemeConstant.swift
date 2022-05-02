//
//  ThemeConstant.swift
//  Demo_Project
//
//  Created by Tradesocio on 05/04/22.
//

import Foundation
import UIKit

class ThemeConstant: NSObject {
    
    //MARK: - Predefined colours
    
    static let btnPrimaryBackgroundColour = UIColor.init(red: 14/255.0, green: 79/255.0, blue: 189/255.0, alpha: 1.0)
    static let selectedTabTintColour = UIColor.init(red: 255/255.0, green: 209/255.0, blue: 68/255.0, alpha: 1.0)
    static let btnColor = UIColor.init(red: 29/255.0, green: 29/255.0, blue: 53/255.0, alpha: 1.0)
    static let whiteColor = UIColor.white
    static let clearColor = UIColor.clear
    static let blackColor = UIColor.black
    static let grayColor = UIColor.gray
    static let greenColor = UIColor.green
    static let redColor = UIColor.red
    static let lighGrayColor = UIColor.lightGray
    static let DarkBlue = UIColor.blue
    
    
    //MARK: - PLIST constant for colours
    static let FontColorWhite = "FontColorWhite"
    static let FontColorBlue = "FontColorBlue"
    static let FontColorLightGray = "FontColorLightGray"
    static let FontColorGray = "FontColorGray"
    static let FontColorDimGray = "FontColorDimGray"
    static let FontColorRed = "FontColorRed"
    static let FontColorBodyCopy = "FontColorBodyCopy"
    static let FontColorBlack = "FontColorBlack"
    static let FontColorMark = "FontColorMark"
    static let FontColorBrown = "FontColorBrown"
    static let FontColorYellow = "FontColorYellow"
    static let FontColorPink = "FontColorPink"
    static let FontColorSummarySuccess = "FontColorSummarySuccess"
    static let FontColorSummaryBackground = "FontColorSummaryBackground"
    static let FontColorNavyBlue = "FontColorNavyBlue"
    static let FontColorOrange = "FontColorOrange"
    static let FontColorGreen = "FontColorGreen"
    static let FontColourMustard = "FontColourMustard"
    static let FontColorDarkGray = "FontColorDarkGray"
    static let FontColorActualGreen = "FontColorActualGreen"
    static let FontColorSliderSelected = "FontColorSliderSelected"
    static let FontColorStatusBar = "FontColorStatusBar"
    static let FontColorDarkMustard = "FontColorDarkMustard"
    static let FontColorLightMustard = "FontColorLightMustard"
    static let FontColorRedGold = "FontColorRedGold"
    static let FontColorRedWhite = "FontColorRedWhite"
    static let FontColorRedBlack = "FontColorRedBlack"
    static let FontColorFeedBackGreen = "FontColorFeedBackGreen"
    static let FontColorTabSelected = "FontColorTabSelected"
    static let FontColorTopMenu = "FontColorTopMenu"
    static let FontColorLinkLightBlue = "FontColorLinkLightBlue"
    static let FontPathColorTobeChanged = "#D41C22"
    static let FontColorSOSBG = "FontColorSOSBG"
    static let FontColorGolden = "FontColorGolden"
    static let FontColorLightGolden = "FontColorLightGolden"
    static let FontColorSOSText = "FontColorSOSText"
    static let FontColorTextError = "FontColorTextError"
    static let FontColorGoldenMF = "FontColorGoldenMF"
    static let FontColorArrowBG = "#CEA05B"
    static let FontColorArrow = "#FFFFFF"
    static let FontColorGoldenMFCal = "FontColorGoldenMFCal"
    static let FontColorRedRed = "FontColorRedRed"
    static let FontColorCyan = "FontColorCyan"
    static let FontColorRedGolden = "FontColorRedGolden"
    static let FontColorBlackBlue = "FontColorBlackBlue"
    static let FontColorFlatButton = "FontColorFlatButton"
    static let FontColorFlatButtonBlue = "FontColorFlatButtonBlue"
    static let FontColorReferralGray = "FontColorReferralGray"
    static let FontColorRegisterBlue = "FontColorRegisterBlue"
    static let FontColorLightBlue = "FontColorLightBlue"
    static let FontColorCrestRed = "FontColorCrestRed"
    static let SeparatorLineColorInForm15 = "SeparatorLineColorInForm15"
    static let BlueButtonInForm15 = "BlueButtonInForm15"
    static let SuccessTickInForm15 = "SuccessTickInForm15"
    static let FontColorDimGrayCVV = "FontColorDimGrayCVV"
    static let FontColorDimGrayCVV_Val = "FontColorDimGrayCVV_Val"
    static let FontColorRedComingSoon = "FontColorRedComingSoon"
    static let FontColorRedMandate = "FontColorRedMandate"
    static let FontColorDarkestGray = "FontColorDarkestGray"
    static let FontColorNote = "FontColorNote"
    static let FontColorGoogleBlue = "FontColorGoogleBlue"
    static let SuccessTickRBBLite = "SuccessTickRBBLite"
    static let GroupSafeguardGradient1 = "GroupSafeguardGradient1"
    static let GroupSafeguardGradient2 = "GroupSafeguardGradient2"
    static let FontColorASBALightGray = "FontColorASBALightGray"
    static let FontColorASBAHeaderGray = "FontColorASBAHeaderGray"
    static let ASBASeparatorGray = "ASBASeparatorGray"
    static let ASBAAddRemoveHolderSkyBlue = "ASBAAddRemoveHolderSkyBlue"
    static let ASBASuccessMessageColor = "ASBASuccessMessageColor"
    static let ASBASuccessTickGreen = "ASBASuccessTickGreen"
    static let SupportBlueText = "SupportBlueText"
    static let DebitCardOfferBox = "DebitCardOfferBox"
    static let DebitCardOfferDiffernceLine = "DebitCardOfferDiffernceLine"
    static let grayBorderColor = "grayBorderColor"
    static let DashboardCarouselBgColor = "DashboardCarouselBgColor"
    static let FaintGray = "FaintGray"
    static let FontColorDashboardGrid = "FontColorDashboardGrid"
    static let titleFont_Color = "titleFont_Color"
    static let TitleFont_Dashboard = "TitleFont_Dashboard"
    static let AddPayeeBackground = "AddPayeeBackground"
   
    //MARK: - PLIST constant for fontSize
    static let FontRobotoRegular = "FontRobotoRegular"
    static let FontRobotoBold = "FontRobotoBold"
    static let FontRobotoThin = "FontRobotoThin"
    static let FontRobotoLight = "FontRobotoLight"
    static let FontRobotoMedium = "FontRobotoMedium"
    static let FontSizeXXXXXXS = "FontSizeXXXXXXS"
    static let FontSizeXXXXXS = "FontSizeXXXXXS"
    static let FontSizeXXXXS = "FontSizeXXXXS"
    static let FontSizeXXXS = "FontSizeXXXS"
    static let FontSizeXXS = "FontSizeXXS"
    static let FontSizeXS = "FontSizeXS"
    static let FontSizeS = "FontSizeS"
    static let FontSizeM = "FontSizeM"
    static let FontSizeL = "FontSizeL"
    static let FontSizeXL = "FontSizeXL"
    static let FontSizeXXL = "FontSizeXXL"
    static let FontSizeXXXL = "FontSizeXXXL"
    static let FontSizeXXXXL = "FontSizeXXXXL"
    static let FontSizeXXXXXL = "FontSizeXXXXXL"
    static let FontSizeXXXXXXL = "FontSizeXXXXXXL"
    static let FontSizeXXXXXXXL = "FontSizeXXXXXXXL"
    static let FontSizeCellIcon = "FontSizeCellIcon"
    static let FontSizeSuccessTick = "FontSizeSuccessTick"
    static let FontSizeSuccessTickSmall = "FontSizeSuccessTickSmall"
}
