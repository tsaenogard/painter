//
//  ViewController.swift
//  painter
//
//  Created by Xcode on 2017/6/12.
//  Copyright © 2017年 wtfcompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let painter = GJPainter(frame: self.view.bounds)
        painter.backgroundColor = UIColor.black
        painter.brush = GJPencilBrush()
        self.view.addSubview(painter)
        
//        let pic = UIImagePNGRepresentation(painter.image!)
        //try? pic?.write(to: URL)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

