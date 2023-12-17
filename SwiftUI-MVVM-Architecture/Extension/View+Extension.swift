//
//  View+Extension.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 17/12/23.
//

import SwiftUI
import Foundation

extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S: ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }
