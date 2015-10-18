//
//  ViewController.swift
//  Carousel
//
//  Created by Deepak Deshpande on 10/17/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var introScroll: UIScrollView!

    
    @IBOutlet weak var introImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        introScroll.contentSize = introImage.image!.size
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

