//
//  ViewController.swift
//  NSButtonDemo
//
//  Created by HeJeffery on 2017/10/2.
//  Copyright © 2017年 HeJeffery. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pushStyleButton: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 修改button的字体大小
        pushStyleButton.font = NSFont.systemFont(ofSize: 15)
    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func pushStyleButtonAction(_ sender: NSButton) {
        print("push style button action")
    }
    
}

