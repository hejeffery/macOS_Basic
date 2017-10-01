//
//  ViewController.swift
//  HelloMacOS
//
//  Created by HeJeffery on 2017/10/1.
//  Copyright © 2017年 HeJeffery. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let grayView = NSView()
        // 坐标系和iOS的不一样，macOS的坐标系的原点是左下角
        grayView.frame = NSMakeRect(10, 10, 100, 100)
        grayView.backgroundColor = NSColor.gray
        view.addSubview(grayView)
    }

    override var representedObject: Any? {
        didSet {
        }
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

