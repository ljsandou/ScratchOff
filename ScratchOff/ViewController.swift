//
//  ViewController.swift
//  ScratchOff
//
//  Created by 三斗 on 6/27/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var scratchOffImageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    let touch = touches.first
    let centerPonit = touch?.locationInView(scratchOffImageView)
    let pointRect = CGRectMake((centerPonit?.x)!, (centerPonit?.y)!, 20, 20)
    UIGraphicsBeginImageContextWithOptions(scratchOffImageView.bounds.size, false, 0)
    if let ref = UIGraphicsGetCurrentContext(){
      scratchOffImageView.layer.renderInContext(ref)
      CGContextClearRect(ref, pointRect)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      scratchOffImageView.image = image
    }
  }
}

