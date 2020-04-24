//
//  ViewController.swift
//  test
//
//  Created by Jz D on 2020/4/24.
//  Copyright © 2020 Jz D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let red = Red(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    
    
    let red_t = Red(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    
    
    
    var animaT = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(red)
        view.addSubview(red_t)
    }

    
    
    
    @IBAction func startAnima(_ sender: UIButton) {
        red_t.stopAnima()
        red.stopAnima()
        
        red_t.isHidden = true
        red.isHidden = true
        
        
        if animaT{
            red.isHidden = false
            red.startAnimating()
        }
        else{
            red_t.isHidden = false
            red_t.startAnimating()
        }
        animaT.toggle()
        
    }
    
    
    

}




class Red: UIView{
    
    var isAnimating = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.red
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func startAnimating() {
         
         if isAnimating == false {
             isAnimating = true
             animateForward()
         }
     }
    
     public func stopAnima() {
         if isAnimating{
             isAnimating = false
             stopAnimating()
         }

     }
}



extension UIView{
    func animateForward(){
        let animation = CAKeyframeAnimation()
        animation.isRemovedOnCompletion = true
        animation.keyPath = "position.y"
        animation.values = [0, 40, 40, 0]
        animation.keyTimes = [0, 0.3, 0.7, 1]
        animation.duration = 1
        animation.isAdditive = true
        layer.add(animation, forKey: nil)
    }
    
    func stopAnimating(){
        layer.removeAllAnimations()

    }
}
