//
//  ProductsStoreServiceImpl.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

class ProductsStoreServiceImpl: ProductsStoreService {
    
    func fetchProducts(
        handler: @escaping (Result<Products, Error, Bool>) -> Void
    ){
        handler(.loading(true))
        
        ApiClient.shared.fetch(
            url: Services.products,
            httpMethod: HttpMethod.GET,
            success: { products in
                handler(.success(products))
            }, failure: {error in
                handler(.failure(error))
            }, completed: {
                handler(.loading(false))
            }
        )
    }
}

