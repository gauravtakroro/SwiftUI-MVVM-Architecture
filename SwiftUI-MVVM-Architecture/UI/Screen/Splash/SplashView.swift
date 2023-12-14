//
//  SplashView.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isShowSplash: Bool
    
    var body: some View {
        VStack {
            VStack {
                Image("swiftui_icon1").resizable()
                    .frame(width: 60, height: 60)
                Text("SwiftUI with MVVM Architecture")
            }
            .scaleEffect()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isShowSplash = false
                }
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
    }
}
