//
//  APIConsts.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

enum Api : String {
    case BASE_URL = "https://api.escuelajs.co/api"
}

enum ApiVersion : String {
    case v1 = "v1"
}

struct Services {
    static let products = "\(Api.BASE_URL.rawValue)/\(ApiVersion.v1.rawValue)/products"
}
