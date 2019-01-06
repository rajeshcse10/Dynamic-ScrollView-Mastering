//
//  ViewController.swift
//  ScrollViewMastering
//
//  Created by Rajesh Karmaker on 2/1/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewOne: CustomViewOne!
    @IBOutlet weak var viewTwo: CustomViewTwo!{
        didSet{
            viewTwo.parentViewController = self
        }
    }
    @IBOutlet weak var viewThree: CustomViewThree!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

