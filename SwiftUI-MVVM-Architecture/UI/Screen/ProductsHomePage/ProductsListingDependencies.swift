//
//  ProductsListingDependencies.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 17/12/23.
//

protocol ProductsListingInteractorDependenciesProtocol {
    var productsService : ProductsStoreService { get set }
    func getProductsListing(handler: @escaping (Result<Products, Error, Bool>) -> Void)
}

struct ProductsListingInteractorDependencies: ProductsListingInteractorDependenciesProtocol {
    
    var productsService: ProductsStoreService
    
    init() {
        print("ProductsListingInteractorDependencies--resolve")
        productsService = Resolver.shared.resolve(ProductsStoreService.self)
    }
    
    func getProductsListing(handler: @escaping (Result<Products, Error, Bool>) -> Void) {
        self.productsService.fetchProducts { result in
            switch result {
            case .success(let data):
                handler(.success(data))
            case .failure(let error):
                handler(.failure(error))
            case .loading(let isLoading):
                handler(.loading(isLoading))
            }
        }
    }
    
}
