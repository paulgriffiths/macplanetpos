//
//  AppDelegate.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/3/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

private var refreshSeconds = 5.0

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var refreshMenuItem: NSMenuItem?
    private weak var timer: NSTimer?
    var mainWindowController: MainWindowController?

    private var timerActive = false {
        didSet {
            if let refreshMenuItem = refreshMenuItem {
                refreshMenuItem.state = timerActive ? NSOnState : NSOffState
            }
            
            if timerActive {
                timer = NSTimer.scheduledTimerWithTimeInterval(refreshSeconds, target: self,
                    selector: Selector("timerFired:"), userInfo: nil, repeats: true)
            }
            else {
                invalidateTimer()
            }
        }
    }
    
    //  MARK: - NSApplicationDelegate methods
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        self.mainWindowController = mainWindowController
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        invalidateTimer()
    }

        func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    //  MARK: - Action methods
    
    @IBAction func refreshMenuItemSelected(sender: NSMenuItem) {
        timerActive = !timerActive
    }
    
    //  MARK: - Helper methods
    
    func timerFired(sender: NSTimer) {
        mainWindowController?.updateData()
    }
    
    private func invalidateTimer() {
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
    }
}

