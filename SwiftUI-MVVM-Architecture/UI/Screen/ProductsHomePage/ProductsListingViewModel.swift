//
//  ProductsListingViewModel.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 17/12/23.
//

import Foundation
import Combine

protocol ProductsListingViewModelProtocol: ObservableObject {
    var showNextUIOfNavigationFlow: Bool { get set }
    var isLoading: Bool { get set }
    var dependencies: ProductsListingInteractorDependenciesProtocol { get set }
    var products: Products? { get set }
    func loadProductsListing()
    var isShowWebView: Bool { get set }
    var productImageUrl: String? { get set }
}

class ProductsListingViewModel: ProductsListingViewModelProtocol {
    @Published var showNextUIOfNavigationFlow: Bool = false
    @Published var isLoading: Bool = false
    @Published var products: Products? = nil
    @Published var isShowWebView: Bool = false
    @Published var productImageUrl: String? = nil
  
    var dependencies: ProductsListingInteractorDependenciesProtocol
    
    init(dependencies: ProductsListingInteractorDependenciesProtocol = ProductsListingInteractorDependencies()) {
        self.dependencies = dependencies
    }
    
    func loadProductsListing() {
        DispatchQueue.main.async {
            self.dependencies.getProductsListing { result in
                switch result {
                case .success(let data):
                    Just(data)
                        .receive(on: RunLoop.main)
                        .assign(to: &self.$products)
                case .failure(let error):
                    print(error.localizedDescription)
                    //router.
                case .loading(let isLoading):
                    Just(isLoading)
                        .receive(on: RunLoop.main)
                        .assign(to: &self.$isLoading)
                }
            }
        }
    }
    
    func showWebBrowserView(url: String) -> WebBrowserView {
        return WebBrowserView(url: URL(string: url)!)
    }
}
