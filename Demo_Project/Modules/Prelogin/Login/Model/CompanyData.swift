//
//  CompanyData.swift
//  Demo_Project
//
//  Created by Tradesocio on 06/04/22.
//

import Foundation
// MARK: - WelcomeElement
struct CompanyData : Codable {
    let name, email, id: String?
    let joining: Date?
}
