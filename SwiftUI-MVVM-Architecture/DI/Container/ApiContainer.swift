//
//  ApiContainer.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 12/12/23.
//

import Swinject

class ApiContainer {
    
    static var shared = ApiContainer()
    
    func buid() -> Container {
        
        let container = Container()
        
        return container
    }
    
}
