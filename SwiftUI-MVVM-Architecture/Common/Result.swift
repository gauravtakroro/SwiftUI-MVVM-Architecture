//
//  Result.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import Foundation

enum Result<Success, Failure, Loading> where Failure: Error {
    case success(Success)
    case failure(Failure)
    case loading(Loading)
}
