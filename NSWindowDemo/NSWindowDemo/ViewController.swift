//
//  ViewController.swift
//  NSWindowDemo
//
//  Created by jhe.jeffery on 2017/10/11.
//  Copyright © 2017年 JefferyHe. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var modalWind: NSWindow?

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(closeModalWindow(_:)), name: NSNotification.Name(rawValue: "NSWindowWillCloseNotification"), object: nil)
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    @objc private func closeModalWindow(_ nihao: NSWindow) {
        NSApplication.shared.stopModal()
    }

    @IBAction func showModalWindow(_ sender: NSButton) {
        self.modalWind = nil
        let rect = NSRect(x: 0, y: 0, width: 300, height: 300)
        let windowStyleMask: NSWindow.StyleMask = [.titled, .closable, .resizable]
        let modalWindow = NSWindow(contentRect: rect, styleMask: windowStyleMask, backing: .buffered, defer: false)
        modalWindow.title = "创建的Modal Window"
        modalWindow.makeKeyAndOrderFront(self)
        modalWindow.center()
        self.modalWind = modalWindow
        NSApplication.shared.runModal(for: modalWindow)
    }
    
}

