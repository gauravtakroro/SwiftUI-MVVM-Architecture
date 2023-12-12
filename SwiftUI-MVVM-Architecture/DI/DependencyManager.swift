//
//  DependencyManager.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 12/12/23.
//

import Foundation
import Swinject

@propertyWrapper
struct Inject<Component> {
    
    let wrappedValue: Component
    
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
