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
    
    var mainWindow: NSWindow?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNotification()

        mainWindow = NSApplication.shared.windows.first
        mainWindow?.title = "修改后window title"
        
        manageTitleBar()
        
        configuringWindows()
        
        movingWindow()
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    // MARK: - Action
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
    
    // MARK: - Private Method
    fileprivate func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(closeModalWindow(_:)), name: NSNotification.Name(rawValue: "NSWindowWillCloseNotification"), object: nil)
    }
    
    @objc private func closeModalWindow(_ nihao: NSWindow) {
        NSApplication.shared.stopModal()
    }
    
    // window的配置
    fileprivate func configuringWindows() {
//        // 是否进入全屏模式。参数是发送消息的对象，现在是当前的controller发送消息
//        mainWindow?.toggleFullScreen(self)
        
        let isWorksWhenModal = mainWindow?.worksWhenModal
        print("当其他window以模态模式出现时，该窗口是否能接受事件处理: \(String(describing: isWorksWhenModal))")
        
//        // alpha值
//        mainWindow?.alphaValue = 0.5
        
//        // 背景色
//        mainWindow?.backgroundColor = NSColor.cyan
    }
    
    // 管理title bar的api
    fileprivate func manageTitleBar() {
//        // closeButton 关闭按钮
//        // miniaturizeButton 最小化按钮
//        // zoomButton 最大化按钮
//        // 是否隐藏关闭按钮
//        mainWindow?.standardWindowButton(.closeButton)?.isHidden = true
        
//        // titlebar是否透明，默认是不透明的
//        mainWindow?.titlebarAppearsTransparent = true
        
        // 是否有阴影
//        mainWindow?.hasShadow = false
    }
    
    // 移动window
    fileprivate func movingWindow() {
        // 是否能通过移动window的背景来移动window，默认是false
        mainWindow?.isMovableByWindowBackground = true
    }
}

extension NSView {
    // NSView没有backgroundColor属性，要设置背景色，要使用layer。并设置wantsLayer为true
    var backgroundColor: NSColor? {
        get {
            if let color = layer?.backgroundColor {
                return NSColor(cgColor: color)
            }
            return nil
        }
        
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}

