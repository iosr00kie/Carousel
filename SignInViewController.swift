//
//  SignInViewController.swift
//  Carousel
//
//  Created by Deepak Deshpande on 10/18/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit
import Darwin

class SignInViewController: UIViewController {

    @IBOutlet weak var signInActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signInView: UIImageView!
    
    @IBOutlet weak var loginForm: UIImageView!
    
    var loginFormInitialY: CGFloat!
    
    var signInViewInitialY: CGFloat!
    
    let loginFormOffset: CGFloat = -70
    
    let signInViewOffset: CGFloat = -200
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        signInViewInitialY = signInView.frame.origin.y
        loginFormInitialY = loginForm.frame.origin.y
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressSignIn(sender: UIButton) {
        
        self.signInActivityIndicator.startAnimating()
        
        delay(3){
            
        self.performSegueWithIdentifier("timeLineSegue", sender: nil)
        }
        
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        loginForm.frame.origin.y = loginForm.frame.origin.y + loginFormOffset
        
        signInView.frame.origin.y = signInView.frame.origin.y + signInViewOffset
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        loginForm.frame.origin.y = loginFormInitialY
        signInView.frame.origin.y = signInViewInitialY
    }

    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
