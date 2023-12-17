//
//  ProductItemView.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 17/12/23.
//

import SwiftUI

struct ProductItemView: View {
    
    var product: Product
    @State var uiImage = UIImage(named: "swiftui_icon1")!
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.white)
                    .frame(alignment: .top)
                    .addBorder(Color.gray, width: 1, cornerRadius: 10)
                HStack {
                    Image(uiImage: uiImage).resizable()
                        .frame(width: 120, height: 120).onAppear {
                            if product.images.count > 0 {
                                UIImage.fromUrlWithUrlSession(url: product.images[0], completion: { uiImageValue in
                                    if uiImageValue != nil {
                                        uiImage = uiImageValue!
                                    }
                                })
                            }
                        }
                    VStack (alignment: .leading) {
                        Text(product.title)
                            .bold()
                            .font(.system(size: 20))
                        Text(product.description)
                            .font(.system(size: 14))
                        Text("Price : ₹ \(String(product.price))")
                        Text("Category: \(product.category?.name ?? "NA")").bold()
                            .foregroundColor(Color.blue).font(.system(size: 16))
                    }.padding(.top, 16)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .padding()
                .frame(maxWidth:.infinity)
            }.shadow(color: Color.gray.opacity(0.3), radius: 15)
                .padding(.top, 30).padding(.horizontal, 20)
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: ProductMock.model())
    }
}


