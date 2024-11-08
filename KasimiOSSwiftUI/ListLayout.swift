//
//  ListLayout.swift
//  KasimiOSSwiftUI
//
//  Created by Sefa Aycicek on 8.11.2024.
//

import SwiftUI

struct ListLayout: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    HorizontalStack()
                }
            }
        }
    }
}

struct HorizontalStack : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.red)
                        .frame(width: 200, height: 150)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ListLayout()
}
