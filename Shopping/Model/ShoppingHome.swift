//
//  ShoppingHome.swift
//  Shopping
//
//  Created by INI SYSTEMS on 01/10/23.
//

import Foundation

// MARK: - Shopping
struct ShoppingHome: Codable, Equatable, Hashable {
    
    var status: Bool?
    var homeData: [Home]?
    
}

// MARK: - HomeDatum
struct Home: Codable, Equatable, Hashable {
    
    var type: String?
    var values: [Value]?
    
}

// MARK: - Value
struct Value: Codable, Equatable, Hashable {
    
    var id: Int?
    var name: String?
    var imageURL, bannerURL: String?
    var image: String?
    var actualPrice, offerPrice: String?
    var offer: Int?
    var isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
    
}
