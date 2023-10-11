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
            
            Text("Grant permissions to FuzzyKeyboadCleanTool via System Settings > Privacy & Security > Accessibility")
                .padding()
            
            Image("systemsettings")
                .resizable()
                        
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
                .padding()
            }
        }

#Preview {
    ContentView()
}
