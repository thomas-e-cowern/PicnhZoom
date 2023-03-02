//
//  ContentView.swift
//  PinchZoom
//
//  Created by Thomas Cowern on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset:CGSize = .zero
    
    // MARK: - Reset Function
    func restImageState () {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.clear
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.7), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                // MARK: Tap Gesture
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                           restImageState()
                        }
                    })
                // MARK: Drag Gesture
                    .gesture(
                        DragGesture()
                        .onChanged({ value in
                            withAnimation(.linear(duration: 0.5)) {
                                imageOffset = value.translation
                            }
                        })
                        .onEnded({ _ in
                            if imageScale <= 1 {
                                restImageState()
                            }
                        })
                    )
            } //: End of ZStack
            .navigationTitle("Pinch and Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isAnimating = true
            }
            
            // MARK: Info Panel
            .overlay(InfoPanelView(scale: imageScale, offset: imageOffset).padding(.horizontal).padding(.top, 30), alignment: .top)
            
            // MARK: Controls
            .overlay(
                Group {
                    HStack {
                        // Scale down
                        Button {
                            // Scale down
                        } label: {
                            Image(systemName: "minus.magnifyingglass")
                                .font(.system(size: 36))
                        }
                        
                        // Reset
                        Button {
                            // Reset
                        } label: {
                            Image(systemName: "arrow.uturn.backward.circle")
                                .font(.system(size: 36))
                        }
                        
                        // Scale up
                        Button {
                            // Scale up
                        } label: {
                            Image(systemName: "plus.magnifyingglass")
                                .font(.system(size: 36))
                        }
                    }
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
