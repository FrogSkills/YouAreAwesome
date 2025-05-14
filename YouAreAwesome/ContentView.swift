//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Miguel on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("You Are Awesome!")
            Text("I am an app developer!")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
