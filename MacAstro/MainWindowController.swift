//
//  MainWindowController.swift
//  MacAstro
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    @IBOutlet weak var planetData: PlanetData?
    @IBOutlet weak var tableView: NSTableView?
    @IBOutlet weak var timeLabel: NSTextField?
    
    override func windowDidLoad() {
        super.windowDidLoad()
        updateRefreshTime()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    private func updateRefreshTime() {
        if let data = planetData, let label = timeLabel {
            label.stringValue = data.lastUpdated
        }
    }
    
    @IBAction func refreshData(sender: NSButton) {
        if let data = planetData, let table = tableView {
            data.refresh()
            updateRefreshTime()
            table.reloadData()
        }
    }
}
