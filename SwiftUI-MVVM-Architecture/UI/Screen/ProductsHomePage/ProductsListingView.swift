//
//  ProductsListingView.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 16/12/23.
//

import SwiftUI

struct ProductsListingView: View {
     
    @StateObject var productListingViewModel: ProductsListingViewModel
    
    var body: some View {
        NavigationView {
            main.navigationBarTitle("Products")
        }
    }
    
    var main: some View {
        VStack {
            if productListingViewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            }
            else {
                ScrollView {

                    if let products = productListingViewModel.products {
                        VStack {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .onAppear {
            productListingViewModel.loadProductsListing()
        }
    }
}

struct ProductsListingView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListingView(productListingViewModel: ProductsListingViewModel())
    }
}

