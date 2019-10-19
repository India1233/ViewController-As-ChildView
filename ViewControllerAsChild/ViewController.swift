//
//  ViewController.swift
//  ViewControllerAsChild
//
//  Created by shiga on 19/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    //create object for SecondViewController
    
    let secondVC = SecondViewController()

    
    //create width for button
    
    let width:CGFloat = 150.0

    // create button for action
    
    var showButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.center.y, width: width, height: 50)
        button.backgroundColor = .black
        button.setTitle("showView", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 26)
        button.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
        return button
    }
    
    // button action
    
    @objc func showViewController() {
        
// methods for showing SecondViewController as child to ViewController
        
//        self.view.addSubview(secondVC.view)
//        self.addChild(secondVC)
//        secondVC.didMove(toParent: self)
        
        // by adding same above methods through extension
        
        add(secondVC)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .red
        self.view.addSubview(showButton)
    }
    
    
}


class SecondViewController: UIViewController {
    
    //create width for button

    let width:CGFloat = 150.0

    // create button for action

    var hideButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.width/2 - width/2, y: self.view.center.y, width: width, height: 50)
        button.backgroundColor = .black
        button.setTitle("hideView", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 26)
        button.addTarget(self, action:#selector(popViewController), for: .touchUpInside)
        return button
    }
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .yellow
        self.view.addSubview(hideButton)
    }
    

    @objc func popViewController() {
//        self.willMove(toParent: self)
//        self.view.removeFromSuperview()
//        self.removeFromParent()
        remove()
    }

}


// extension for creating viewcontroller as childview to another viewcontroller


extension UIViewController {
    func add(_ child:UIViewController)  {
        self.view.addSubview(child.view)
        self.addChild(child)
        child.didMove(toParent: self)
    }
    
    func remove()  {
        guard parent != nil else {
            return
        }
        self.willMove(toParent: self)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
