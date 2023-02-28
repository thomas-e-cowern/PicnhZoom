//
//  ContentView.swift
//  PinchZoom
//
//  Created by Thomas Cowern on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - Function
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2)
            } //: End of ZStack
            .navigationTitle("Pinch and Zoom")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
