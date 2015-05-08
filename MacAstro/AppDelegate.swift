//
//  AppDelegate.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        self.mainWindowController = mainWindowController
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    //  Terminate the app by the red button
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}

