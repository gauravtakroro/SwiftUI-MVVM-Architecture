//
//  Product.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

struct Product : Identifiable, Decodable {
    let id : Int?
    var title : String = ""
    var price : Int = 0
    var description : String = ""
    var images : [String] = []
    var creationAt : String = ""
    var updatedAt : String = ""
    var category : Category?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case images = "images"
        case creationAt = "creationAt"
        case updatedAt = "updatedAt"
        case category = "category"
    }
}

typealias Products = [Product]

