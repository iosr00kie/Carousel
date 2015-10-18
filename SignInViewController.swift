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
   
    
    @IBOutlet weak var signInView: UIView!
    
    @IBOutlet weak var loginForm: UIView!
    
    var loginFormInitialY: CGFloat! = 0
    
    var signInViewInitialY: CGFloat! = 0
    
    let loginFormOffset: CGFloat = -70
    
    let signInViewOffset: CGFloat = -200
    
    var hasKeyBoardMoved: Bool = false
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    let alertController = UIAlertController(title: "Invalid Credentials", message: "Email or password are incorrect", preferredStyle: .Alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        signInViewInitialY = signInView.frame.origin.y
        loginFormInitialY = loginForm.frame.origin.y
        
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressSignIn(sender: UIButton) {
        
        // If fields are empty show a UIAlert View
        
        if(email.text!.isEmpty || password.text!.isEmpty){
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
        else if(email.text == "deepak" && password.text == "password"){
            self.signInActivityIndicator.hidden = false
            self.signInActivityIndicator.startAnimating()
            delay(2){
                self.performSegueWithIdentifier("timeLineSegue", sender: nil)
            }
        }
        else if(email.text != "deepak" || password.text != "password"){
            self.signInActivityIndicator.startAnimating()
            delay(2){
                self.signInActivityIndicator.hidden = true
                self.presentViewController(self.alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
            self.signInActivityIndicator.hidden = false
        }
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        if(hasKeyBoardMoved == false) {
            
            loginForm.frame.origin.y = loginForm.frame.origin.y + loginFormOffset
            signInView.frame.origin.y = signInView.frame.origin.y + signInViewOffset
            hasKeyBoardMoved = true
        }
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        if(hasKeyBoardMoved == true) {
            loginForm.frame.origin.y = loginFormInitialY
            signInView.frame.origin.y = signInViewInitialY
            hasKeyBoardMoved = false
        }
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
