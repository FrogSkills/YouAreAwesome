//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Miguel on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    
    @State private var incrementingMessage = 0
    
    
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)

            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
                
                Button("Show Message!") {
                    
                    let messages = ["You are Awesome!", "You are Great!", "You are Amazing", "You can do it!", "When the genius bar needs hep they call you!"]
                    
//                    let message1 = "You are Awesome!"
//                    let message2 = "You are Great!"
//                    message = (message == message1 ? message2 : message1)
                    message = messages[incrementingMessage]
                    if incrementingMessage != (messages.count - 1) {
                        incrementingMessage += 1
                    } else {
                        incrementingMessage = 0
                    }
                    
                    
                    print(/*messages[incrementingMessage]*/
                        messages[.random(in: 0...messages.count-1)])
                    
                    
                    
                    imageName = "image\(Int.random(in: 0...8))"
                }
                
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
