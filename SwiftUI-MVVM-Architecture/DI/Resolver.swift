//
//  Resolver.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 12/12/23.
//

import Swinject

class Resolver {
    
    static let shared = Resolver()
    
    private var container = ApiContainer.shared.buid()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}
