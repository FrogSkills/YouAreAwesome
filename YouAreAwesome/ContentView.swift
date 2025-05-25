//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Miguel on 5/14/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        
        ZStack {
//            Color.orange
            
            VStack {
                Text(message)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .frame(height: 100)
                    .animation(.easeInOut(duration: 0.15), value: message)
                
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(radius: 30)
                    .animation(.default, value: imageName)
                
                Spacer()
                
                HStack {
                    Text("Sound On:")
                    Toggle("", isOn: $soundIsOn)
                        .labelsHidden()
                        .onChange(of: soundIsOn) {
                            if audioPlayer != nil && audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                        }

                    
                    Spacer()
                    
                    Button("Show Message!") {
                        let messages = ["You are Awesome!",
                                        "When the Genius Bar needs Help, They Call You!",
                                        "You Are Great!",
                                        "You Are Fantastic!",
                                        "Fabulous? That's You!",
                                        "You Make Me Smile!"]
                        
                        lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                        print($lastMessageNumber)
                        //                    message = messages[lastMessageNumber]
                        
                        lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                        imageName = "image\(lastImageNumber)"
                        
                        lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                        if soundIsOn {
                            playSound(soundName: "sound\(lastSoundNumber)")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                }
            }
            .tint(.accentColor)
            .padding()
        }
    }
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
           var newNumber : Int
           repeat {
               newNumber = Int.random(in: 0...upperBounds)
           } while newNumber == lastNumber
        return newNumber
       }
    
    func playSound (soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
                audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file name")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR. \(error.localizedDescription) creating audioPlayer")
        }
    }
    
   
}

#Preview ("Light Mode"){
    ContentView()
        .preferredColorScheme(.light)
}


#Preview ("Dark Mode"){
    ContentView()
        .preferredColorScheme(.dark)
}
