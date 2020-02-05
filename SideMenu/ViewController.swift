//
//  ViewController.swift
//  SideMenu
//
//  Created by JOEL CRAWFORD on 2/5/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var menu_vc: MenuViewController
    var menu_vc:  MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        menu_vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController
        //=====swipe guesture==
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
        //swipe gesturr for left
        
        //=====swipe guesture==
               let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
               swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        
        //=====adding them to view===
        self.view.addGestureRecognizer(swipeLeftGesture)
        
        self.view.addGestureRecognizer(swipeRightGesture)
    }
    

    //=====func to response to Gesture==
    @objc func respondToGesture(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            print("right swipe")
            //show menu
            show_menu()

                case UISwipeGestureRecognizer.Direction.left:
                print("left swipe")
            //=====show menu
            close_on_swipe()
        default: break
            
        }
        
    }
    
    
    @IBAction func menu_action(_ sender: UIBarButtonItem) {
        //====perform show menu=====
        
        if AppDelegate.menu_bool {
            //=====show menu if its true
            show_menu()
            
            
        } else {
            //=====hide menu===
            close_menu()
        }
        
    }
    
    //====show menu=======
    func show_menu() {
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChild(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            AppDelegate.menu_bool = false
        }
        
        
    }
    
    //======Hide/close menu====
    func close_menu() {
        UIView.animate(withDuration: 0.3, animations: {
            () -> Void in
            self.menu_vc.view.frame = CGRect(x: -Int(UIScreen.main.bounds.size.width), y: 60, width: Int(UIScreen.main.bounds.size.width), height: Int(UIScreen.main.bounds.size.height))
        }) { (finished) in
            self.menu_vc.view.removeFromSuperview()
           
        }
         AppDelegate.menu_bool = true
        
    }
    //-=======close on swipe====
    
    func close_on_swipe() {
        
        
        if AppDelegate.menu_bool {
            //=====show menu if its true
            //show_menu()
            
            
        } else {
            //=====hide menu===
            close_menu()
        }
        
    }
    
    
}

