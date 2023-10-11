//
//  KeyboardLock.swift
//  FuzzyKeyboardCleanTool
//
//  Created by carson on 2023-10-11.
//

import Foundation
import CoreFoundation
import CoreGraphics

var eventTap: CFMachPort?

func eventTapCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
   // Check the type of event
   if type == .keyDown || type == .keyUp {
       // Suppress keyboard events (do not call the next handler)
       return nil
   }
   // For other events, pass them through
   return Unmanaged.passRetained(event)
}

func createEventTap() {
   let eventMask = (1 << CGEventType.keyDown.rawValue) | (1 << CGEventType.keyUp.rawValue)
   
   eventTap = CGEvent.tapCreate(tap: .cghidEventTap,
                               place: .headInsertEventTap,
                               options: .defaultTap,
                               eventsOfInterest: CGEventMask(eventMask),
                               callback: eventTapCallback,
                               userInfo: nil)
   
   if eventTap == nil {
       print("Ensure essential permissions granted in System Settings")
       exit(1)
   }
   
   let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
   CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .defaultMode)
   CGEvent.tapEnable(tap: eventTap!, enable: true)
   CFRunLoopRun()
}

func disableEventTap() {
   CGEvent.tapEnable(tap: eventTap!, enable: false)
}