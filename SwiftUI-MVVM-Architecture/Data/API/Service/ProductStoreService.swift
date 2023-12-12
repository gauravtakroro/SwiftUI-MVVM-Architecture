//
//  ProductStoreService.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

protocol ProductsStoreService {
    
    func fetchProducts(handler: @escaping (Result<Products, Error, Bool>) -> Void)
}
