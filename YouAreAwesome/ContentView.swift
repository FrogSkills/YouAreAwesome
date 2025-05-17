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
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    let numberOfImages = 9
    
    
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
//                    message = messages[incrementingMessage]
                    
                    
                    var messagedNumber = Int.random(in: 0...messages.count-1)
                    while messagedNumber == lastMessageNumber {
                        messagedNumber = Int.random(in: 0...messages.count-1)
                    }
                    message = messages[messagedNumber]
                    lastMessageNumber = messagedNumber
                    
                    // Below is the random image generator.
                    var imageNumber : Int
                    repeat {
                        imageNumber = Int.random(in: 0...numberOfImages-1)
                    } while imageNumber == lastImageNumber
                    imageName = "image\([imageNumber])"
                    lastImageNumber = imageNumber
                    
                
                    
                    
                    
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
