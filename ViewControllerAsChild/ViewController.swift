//
//  ViewController.swift
//  ViewControllerAsChild
//
//  Created by shiga on 19/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let width:CGFloat = 150.0
    
    
    let secondVC = SecondViewController()

    var pushButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.center.y, width: width, height: 50)
        button.backgroundColor = .black
        button.setTitle("push", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 26)
        button.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
        return button
    }
    
    @objc func pushViewController() {
//        self.view.addSubview(secondVC.view)
//        self.addChild(secondVC)
//        secondVC.didMove(toParent: self)
        add(secondVC)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        self.view.addSubview(pushButton)
        
    }
    
    
}


class SecondViewController: UIViewController {
    
    let width:CGFloat = 150.0

    var popButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.width/2 - width/2, y: self.view.center.y, width: width, height: 50)
        button.backgroundColor = .black
        button.setTitle("dismiss", for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 26)
        button.addTarget(self, action:#selector(popViewController), for: .touchUpInside)
        return button
    }
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .yellow
        self.view.addSubview(popButton)
    }
    

    @objc func popViewController() {
//        self.willMove(toParent: self)
//        self.view.removeFromSuperview()
//        self.removeFromParent()
        remove()
    }

}



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
