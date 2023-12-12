//
//  SplashView.swift
//  SwiftUI-MVVM-Architecture
//
//  Created by Gaurav Tak on 13/12/23.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isContent : Bool = false
    
    var body: some View {
        if isContent {
            ContentView()
        }
        else {
            VStack {
                VStack {
                    Image("swiftui_icon1").resizable()
                        .frame(width: 60, height: 60)
                    Text("SwiftUI with MVVM Architecture")
                }
                .scaleEffect()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isContent = true
                    }
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
