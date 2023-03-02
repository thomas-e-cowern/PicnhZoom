//
//  ControlImageButton.swift
//  PinchZoom
//
//  Created by Thomas Cowern on 3/2/23.
//

import SwiftUI

struct ControlImageButton: View {
    var symbolName: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                Image(systemName: symbolName)
                    .font(.system(size: 36))
            }
            .padding()
        }
    }
}

struct ControlImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageButton(symbolName: "arrow.uturn.backward.circle") {
            print("Button Clicked")
        }
    }
}
