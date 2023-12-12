//
//  ProductMock.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

class ProductMock {
    
    static func model() -> Product{
        let category =
        Category(id: 1,
                 name: "Clothes",
                 image: "https://i.imgur.com/QkIa5tT.jpeg",
                 creationAt: "2023-12-10T04:40:41.000Z",
                 updatedAt: "2023-12-10T04:40:41.000Z")
        
        return Product(id: 164,
                       title: "New Product",
                       price: 10,
                       description: "A descriptison",
                       images: [
                        "https://placeimg.com/640/480/any"
                       ],
                       creationAt: "2023-12-10T10:58:57.000Z",
                       updatedAt: "2023-12-10T10:58:57.000Z",
                       category: category)
    }
}


