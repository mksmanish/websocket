//
//  FavouritesModel.swift
//  Demo_Project
//
//  Created by Tradesocio on 11/05/22.
//


import Foundation

// MARK: - FavouitesModel
struct FavouitesModel: Codable {
    let success: Bool?
    let data: [FavData]?
    let message: String?
}
class FavData : Codable {
    let accountID: Int?
    let workspaceName: String?
    let brokerID: Int?
    let Default, isDeleted: Bool?
    let createdOn, updatedOn: String?
    let dashboard: [Dashboard]?
    let favSymbols: [String]?
    let orderTemplates: [String]?
    let id: Int?
    let userId:Int?
    let createdBy, updatedBy: Int?
    
    enum CodingKeys:String,CodingKey{
        case id = "id"
        case accountID = "account_id"
        case workspaceName = "workspace_name"
        case brokerID = "broker_id"
        case Default = "default"
        case isDeleted = "is_deleted"
        case createdOn = "created_on"
        case updatedOn = "updated_on"
        case dashboard = "dashboard"
        case favSymbols = "fav_symbols"
        case orderTemplates = "order_templates"
        case userId = "user_id"
        case createdBy = "created_by"
        case updatedBy = "updated_by"
    }
   
}
// MARK: - Dashboard
class  Dashboard : Codable{
    let id, x, y, rows: Int?
    let cols: Int?
    let name: String?
    let minimized, isDeleted: Bool?
    
    enum codingKeys: String,CodingKey {
        case id = "id"
        case x = "x"
        case y = "y"
        case rows = "rows"
        case cols = "cols"
        case name = "name"
        case minimized = "minimized"
        case isDeleted = "is_deleted"
    }
}
