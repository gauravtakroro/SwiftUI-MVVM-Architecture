//
//  ContentView.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 12/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var isShowSplash = true
    var body: some View {
        ZStack {
            if isShowSplash {
                SplashView(isShowSplash: $isShowSplash)
            } else {
                Text("ContentView ProductListing Page")
            }
        }
        .scaleEffect()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
