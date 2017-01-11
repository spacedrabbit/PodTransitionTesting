//
//  ViewController.swift
//  PodTransitionTesting
//
//  Created by Louis Tur on 1/9/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController, IndexTableTitled {
  
  var cellTitle: String = "Basic"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.heroID = "View"
    self.view.backgroundColor = generateRandomColor()
    self.title = "Hero Testing"
    
    setupViewHierarchy()
    configureConstraints()
  }
  
  private func configureConstraints() {
    let _ = [ nextViewControllerButton ].map{ $0.translatesAutoresizingMaskIntoConstraints = false }
    
    let _ =  [
      nextViewControllerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      nextViewControllerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -64.0)
      ].map{ $0.isActive = true }
  }
  
  private func setupViewHierarchy() {
    self.view.addSubview(nextViewControllerButton)
    
    nextViewControllerButton.addTarget(self, action: #selector(gotoNextViewController(sender:)), for: .touchUpInside)
  }
  
  func gotoNextViewController(sender: UIButton) {
    self.navigationController?.pushViewController(ViewController(), animated: true)
  }
  
  
  func generateRandomColor() -> UIColor {
    let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
    let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
    let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var nextViewControllerButton: UIButton = {
    let button: UIButton = UIButton(type: UIButtonType.system)
    button.setTitle("Press to Transition", for: .normal)
    return button
  }()


}

