//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Deepak Deshpande on 10/17/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScroll: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
  
    @IBOutlet weak var spinButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeScroll.contentSize = CGSize(width: 1280, height: 480)

        welcomeScroll.delegate = self
        spinButton.alpha = 0
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
    
        UIView.animateWithDuration(2) { () -> Void in
            if(page == 3){
                self.pageControl.hidden = true
                self.spinButton.alpha = 1
            }
            else{
                self.pageControl.hidden = false
                self.spinButton.alpha = 0
            }

        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
