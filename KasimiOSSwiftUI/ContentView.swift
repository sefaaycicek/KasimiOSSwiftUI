//
//  ContentView.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomView()
    }
}
//VStack, HStack, ZStack
struct CustomView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(width: 10)
                .background(Color.red)
            Text("Hello, world!")
            
            HStack {
                Spacer()
                    .frame(height: 10)
                    .background(Color.red)
                Text("Hello, world!")
                Spacer()
                    .frame(height: 10)
                    .background(Color.red)
                Text("Hello, world!")
                Spacer()
                    .frame(height: 10)
                    .background(Color.red)
                Text("Hello, world!")
                Spacer()
                    .frame(height: 10)
                    .background(Color.red)
            }
            
            Spacer()
                .frame(width: 10)
                .background(Color.red)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
