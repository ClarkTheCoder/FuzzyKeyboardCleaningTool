//
//  ContentView.swift
//  FuzzyKeyboardCleanTool
//
//  Created by carson on 2023-10-11.
//

import SwiftUI

struct ContentView: View {
    @State var isKeyboardLocked: Bool = false

    var body: some View {
        VStack {
            Text("Fuzzy - Keyboard Cleaning Tool")
                .padding()
                .font(.largeTitle)
            
            Text("This application is designed to disable your keyboard temporarily, allowing you to easily clean it without the risk of inadvertently turning on your Mac or generating unintended input. Click 'Lock Keyboard' to begin, and when you're done simply click 'Unlock Keyboard' or exit app.")
                .padding()
                .frame(width: 800)
            
            Text("Drag into Applications folder. Grant permissions via System Settings > Privacy & Security > Accessibility")
                .padding()
                .frame(width: 800)
               
            Button(action: {
                isKeyboardLocked.toggle()
                if isKeyboardLocked {
                    createEventTap()
                } else {
                    disableEventTap()
                    }
                }) {
                    Text(isKeyboardLocked ? "Unlock Keyboard" : "Lock Keyboard")
                    }
                }
            Link("Give me feedback!", destination: URL(string: "https://carsonclark.dev")!)
            .padding()
            }
        }

#Preview {
    ContentView()
}
    
