//
//  ViewController.swift
//  mmytoasty
//
//  Created by Nick Gamroth on 11/25/14.
//  Copyright (c) 2014 asdf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        // this rectangle sets the size of the view
        let screenSize: CGRect = UIScreen.mainScreen().bounds;
        var v = SplashView(frame: CGRectMake(0, 0, screenSize.width, screenSize.height));
        view.addSubview(v);
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

